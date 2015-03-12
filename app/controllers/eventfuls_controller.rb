class EventfulsController < ApplicationController
  def index
    @events = Eventful.all
  end

  def show
    @event = Eventful.find(params[:id])
  end
end
