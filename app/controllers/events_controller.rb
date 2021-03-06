class EventsController < ApplicationController

  def index
    @events = EventPresenter.new(params).events
  end

  def show
    @event = Event.find(params[:id])
    @latlng = Map.latlng(@event)
  end
end
