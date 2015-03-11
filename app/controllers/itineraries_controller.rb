class ItinerariesController < ApplicationController
  def new
    @itinerary = current_user.itineraries.new
    @planner.events(@itinerary)
    @events = @itinerary.events
  end

  def create
    @User = User.find(current_user.id)
    @itinerary = @user.itineraries.new(itinerary_params)
    if @itinerary.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to create itinerary"
      redirect_to new_itinerary_path
    end
  end

  def index
    @upcoming_itineraries = User.find(current_user.id).itineraries.where(status: "upcoming")
    @past_itineraries = User.find(current_user.id).itineraries.where(status: "past")
  end

  def show
    @itinerary = User.find(current_user.id).includes(:itinerary).where(id: params[:id])
  end
end
