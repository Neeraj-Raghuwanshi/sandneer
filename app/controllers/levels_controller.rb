class LevelsController < ApplicationController

  include LevelsHelper
  include FormHelper
  require 'will_paginate/array'

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_level, only: [:show, :edit,:update,:destroy]

  def index
    if request.xhr? && params[:q].present?
      filter_level_list
      @levels = @levels.paginate(:page => params[:page], :per_page => 2)
    else
      @levels = Level.paginate(:page => params[:page], :per_page => 2)
    end
    add_breadcrumb "Classrooms", levels_path
  end

  def show
    add_breadcrumb "Classrooms", levels_path
  end

  def new
    @level = Level.new
  end

  def edit;end

  def create
    @level = Level.new(level_params)
    if @level.save
      flash[:notice] = "Classroom created successfully"
      redirect_to levels_path
    else
      render 'new'
    end
  end

  def update
    @level.update(level_params)
    flash[:notice] = "Classroom updated successfully"
    redirect_to level_path
  end

  def destroy
   @level.destroy
   redirect_to levels_path
  end

  private

  def find_level
    @level = Level.find(params[:id])
  end

  def level_params
    params.require(:level).permit(:name, :description, :teacher_id, :user_id, :classroom_type, {days: []})
  end

end
