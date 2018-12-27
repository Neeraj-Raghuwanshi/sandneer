class AttendancesController < ApplicationController
  include FormHelper

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_attendance, only: [:show, :edit,:update,:destroy]

  def index
    @attendances = Attendance.all
    add_breadcrumb "Attendances", attendances_path
  end

  def show
    add_breadcrumb "Attendances", attendances_path
  end

  def new
    @attendance = Attendance.new
  end

  def edit;end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      flash[:notice] = "Attendance created successfully"
      redirect_to attendances_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private

  def find_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:attendance_date, :present, :level_id, :reason, :student_id, :late, :absent_reason, :authorized_absent_reason)
  end
end
