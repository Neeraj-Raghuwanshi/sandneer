class EventsController < ApplicationController

  include FormHelper
  include EventsHelper

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_event, only: [:show, :edit,:update,:destroy]

  def index
    if request.xhr? && params[:q].present?
      event_filter
    else
    @events = Event.all
    end
    add_breadcrumb "Events", events_path
  end

  def show
    add_breadcrumb "Events", events_path
  end

  def new
    @event = Event.new
  end

  def edit

  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event created successfully"
      redirect_to events_path
    else
      render 'new'
    end
  end

  def update
    @event.update(event_params)
    flash[:notice] = "Event updated successfully"
    redirect_to event_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:key_event_id, :description,:start_date,:end_date)
  end
end
