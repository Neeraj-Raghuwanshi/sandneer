class TeachersController < ApplicationController
  include TeachersHelper
  include FormHelper

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_teacher, only: [:show, :edit,:update,:destroy]

  def index
    if request.xhr? && params[:q].present?
      teacher_filter
    else
      @teachers = Teacher.all
    end
    add_breadcrumb "Teachers", teachers_path
  end

  def show
    add_breadcrumb "Teachers", teachers_path
  end

  def new
    @teacher = Teacher.new
  end

  def edit;end

  def create
    @teacher =  Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = "Teacher created successfully"
      redirect_to teachers_path
    else
      render 'new'
    end
  end

  def update
    @teacher.update(teacher_params)
    flash[:notice] = "Teacher updated successfully"
    redirect_to teacher_path
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :address, :postcode, :contact, :email, :user_id, :active, :crb_checked, :crb_checked_on, :deleted_at, :dbs_ref, :emergencyno_1, :emergencyno_2, :emergencyno_3, :is_disabled, :special_needs, :specialneeds_notes, :disabilities_note, :doctors_name,:employee_number, :start_date, :job_title, :nationality, :NI_number, :salary, :working_hours, :marital_status, :gender, :contract_type, :dob, :leaving_date, :city)
  end

end
