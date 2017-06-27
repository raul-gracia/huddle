class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @search = SavedSearch.from_params(params)
    @events = Event.filter_results(@search)
  end

  def show
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
