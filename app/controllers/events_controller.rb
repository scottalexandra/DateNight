class EventsController < ApplicationController
  def create
    Event.create()
  end


  def index
    if params[:search]
    @events = Event.all(params[:category],
                        params[:search],
                        Event.search_time(params[:date][:month], params[:date][:day], params[:date][:year])
                        ).sort{|e, f| e.start_time <=> f.start_time }
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
    @latlng = Map.latlng(@event)
  end
end
