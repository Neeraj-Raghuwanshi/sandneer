class StudentsController < ApplicationController

  include StudentsHelper
  include FormHelper
  require 'will_paginate/array'

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_student, only: [:show, :edit,:update,:destroy]

  def index
    status_arr = ['All','Enrolled','Applied','Shortlist','Waitlist']
    if request.xhr? && status_arr.include?(params[:commit])
      @students = Student.send(params[:commit].downcase).paginate(:page => params[:page], :per_page => 10)
    elsif request.xhr? && params[:q].present?
      filter_student
      @students = @students.paginate(:page => params[:page], :per_page => 10)
    else
      @students = Student.paginate(:page => params[:page], :per_page => 10)
    end
    add_breadcrumb "Students", students_path
  end

  def show
    add_breadcrumb "Students", students_path
  end

  def new
    @student = Student.new
  end

  def edit;end

  def create
    @student = Student.new(student_params)
    if params[:student][:dd_student] == "1"
      if params[:student][:dd_amount].present? && params[:student][:dd_start_date].present?
        if @student.save
          flash[:notice] = "Student created successfully"
          redirect_to students_path
        else
          render 'new'
        end
      else
        flash[:alert] = "Please fill dd_amount and dd_start_date"
        render 'new'
      end
    else
      if @student.save
        flash[:notice] = "Student created successfully"
        redirect_to students_path
      else
        render 'new'
      end
    end

  end

  def update
    @student.update(student_params)
    flash[:notice] = "Student updated successfully"
    redirect_to student_path
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :name, :gender, :address, :postcode, :parent_id, :user_id, :status, :classroom, :deleted_at, :discount,
    :dob, :start_date, :end_date, :level_id, :student_type, :ethnicity_group, :is_disabled, :special_needs, :students_count, :mobile, :email,
    :specialneeds_notes, :disabilities_note, :school_name, :doctors_name, :pickup_dropoff, :outstanding_fee, :student_ref, :type_id, :emergencyno_1, :emergencyno_2, :emergencyno_3,
    :home_phone, :languages_spoken, :p_maktab_name, :p_maktab_notes,:dd_student,:dd_amount,:dd_start_date,:dd_end_date,
    payments_attributes:[:id, :student_id, :amount, :payment_type, :payment_for, :paid, :payment_from, :payment_until, :payment_term, :paid_on],
    attendances_attributes:[:present, :attendance_date, :id, :student_id, :level_id],
    incidents_attributes:[:id, :entry_no, :description, :place_of_incident, :incident_type,
    :incident_date,
    :action_take,
    :first_aid,
    :concerned_notes,
    :reported_by,
    :student_id], level_ids: [])
  end

end
