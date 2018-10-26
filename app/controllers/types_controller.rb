class TypesController < ApplicationController
  include TypesHelper
  include FormHelper
  require 'will_paginate/array'

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_type, only: [:show, :edit,:update,:destroy]

  def index
    if request.xhr? && params[:q].present?
      type_filter
    else
      @types = Type.paginate(:page => params[:page], :per_page => 10)
    end
    add_breadcrumb "Types", types_path
  end

  def show
    add_breadcrumb "Types", types_path
  end

  def new
    @type = Type.new
  end

  def edit;end

  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:notice] = "Type created successfully"
      redirect_to types_path
    else
      render 'new'
    end
  end

  def update
    @type.update(type_params)
    flash[:notice] = "Type updated successfully"
    redirect_to type_path
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  private

  def find_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :description, :fee, :payment_terms,:user_id)
  end

end
