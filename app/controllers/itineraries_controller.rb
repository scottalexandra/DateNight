class ItinerariesController < ApplicationController
  def new
    @itinerary = current_user.itineraries.new
    @planner.events(@itinerary)
    @events = @itinerary.events

  end

  def create
    @itinerary = current_user.itineraries.new(itinerary_params)
    if @itinerary.save
      session[:planner] = nil
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to create itinerary"
      redirect_to new_itinerary_path
    end
  end

  def show
    @itinerary = current_user.includes(:itinerary).where(id: params[:id])
    @latlng = Map.latlng(@itinerary.events)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :user_id)

  end
end
