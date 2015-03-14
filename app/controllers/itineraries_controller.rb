class ItinerariesController < ApplicationController
  def new
    @itinerary = current_user.itineraries.new
    
    @itinerary.events << @planner.events

  end

  def create
    @itinerary = current_user.itineraries.new(itinerary_params)
    @itinerary.events << @planner.events
    if @itinerary.save
      session[:planner] = nil
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to create itinerary"
      redirect_to new_itinerary_path
    end
  end

  def show
    @itinerary = current_user.itineraries.where(id: params[:id]).take
    @latlng = Map.latlng(@itinerary.events)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :user_id)
  end
end
