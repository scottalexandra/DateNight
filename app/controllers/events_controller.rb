class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search(params[:search]).order("state ASC")
    else
      @events = Event.order("state ASC")
    end
  end

  def show
  end
end
