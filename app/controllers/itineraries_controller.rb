class ItinerariesController < ApplicationController
  def new
    @itinerary = current_user.itineraries.new
    @planner.events(@itinerary)
    @events = @itinerary.events
  end

  def create
    @itinerary = current_user.itineraries.new(itinerary_params)
    if @itinerary.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to create itinerary"
      redirect_to new_itinerary_path
    end
  end

  def index
    @upcoming_itineraries = current_user.itineraries.where(status: "upcoming")
    @past_itineraries = current_user.itineraries.where(status: "past")
  end

  def show
    @itinerary = current_user.includes(:itinerary).where(id: params[:id])
  end
end
