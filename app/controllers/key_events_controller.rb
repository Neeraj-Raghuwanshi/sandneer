class KeyEventsController < ApplicationController

  include FormHelper

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_key_event, only: [:show, :edit,:update,:destroy]

  def index
    @key_events = KeyEvent.all
    add_breadcrumb "KeyEvents", key_events_path
  end

  def show
    add_breadcrumb "KeyEvents", key_events_path
  end

  def new
    @key_event = KeyEvent.new
  end

  def edit;end

  def create
    @key_event = KeyEvent.new(key_events_params)
    if @key_event.save
      flash[:notice] = "Key event created successfully"
      redirect_to key_events_path
    else
      render 'new'
    end
  end

  def update
   @key_event.update(key_events_params)
    flash[:notice] = "Key event updated successfully"
    redirect_to key_event_path
  end

  def destroy
    @key_event.destroy
    redirect_to key_events_path
  end

  private

  def find_key_event
    @key_event = KeyEvent.find(params[:id])
  end

  def key_events_params
    params.require(:key_event).permit(:name, :color)
  end
end
