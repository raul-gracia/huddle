class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = if search_params
      Event.filter_results(search_params)
    else
      Event.all
    end
  end

  def show
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def search_params
      search = params[:search]
      start_time = Time.parse("#{search['start_time(4i)']}:#{search['start_time(5i)']}")
      end_time = Time.parse("#{search['end_time(4i)']}:#{search['end_time(5i)']}")
      {city: search["city"], topics: search["topics"], start_time: start_time, end_time: end_time}
    rescue
      nil
    end
end
