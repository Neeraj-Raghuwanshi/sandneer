class ParentsController < ApplicationController
  include ParentsHelper
  include FormHelper
  require 'will_paginate/array'
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_parent, only: [:show, :edit,:update,:destroy]

  def index
    if request.xhr? && params[:q].present?
      filter_parent
    else
      @parents = Parent.paginate(:page => params[:page], :per_page => 10)
    end
    add_breadcrumb "Parents", parents_path
  end


  def show
    add_breadcrumb "Parents", parents_path
  end

  def new
    @parent = Parent.new
  end

  def edit;end

  def create
    count = 0
    more_count = 0
    @parent = Parent.new(parent_params)
    if params[:parent][:students_attributes].present?
      params[:parent][:students_attributes].each do |student|
        if student.to_a.last[:dd_student] == "1"
         unless student.to_a.last[:dd_amount].present? && student.to_a.last[:dd_start_date].present?
            count = 1
            break
         end
       end
     end
   else
    more_count = 1
   end
   count.eql?(1) || !@parent.save ?  render('new') : redirect_to(parents_path)
   count.eql?(1) ? flash[:alert] = "Please fill dd_amount and dd_start_date" : @parent.save ? flash[:notice] = "Parent created successfully" : nil
  end

  def update
    @parent.update(parent_params)
    flash[:notice] = "Parent updated successfully"
    redirect_to parent_path
  end

  def destroy
    @parent.destroy
    redirect_to parents_path
  end

  def batch_action_parent
    if params[:batch_action] == "delete_selected"
      params[:batch_arr].each do |value|
        @parent = Parent.find(value)
        @parent.delete
      end
    end
  end

  def check_parent_number
    @available = Parent.pluck(:mobile).include?(params[:mobile_number])
    respond_to do |format|
      format.js
    end
  end

  private

  def find_parent
    @parent = Parent.find_by_id(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:name, :address, :postcode, :home_phone, :mobile, :email,:notify, :relationship,:city,:country, students_attributes: [:first_name, :last_name, :dob, :address, :gender, :status, :postcode,:_destroy,:mobile, :email, :home_phone, :languages_spoken, :id,:start_date,:end_date,:ethnicity_group,:school_name,:special_needs,:specialneeds_notes,:pickup_dropoff,:is_disabled,:doctors_name,:disabilities_note,:outstanding_fee,:student_ref,:classroom,:emergencyno_1,:emergencyno_2,:emergencyno_3,:discount,:name,:p_maktab_name,:p_maktab_notes,:dd_student,:dd_amount,:dd_start_date,:dd_end_date,level_ids: []])
  end
end
