class CalendarsController < ApplicationController
  def event_calender

  end
  def get_event_details
    @events = Event.all
    render json: @events
  end  
end
