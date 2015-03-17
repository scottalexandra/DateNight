class ItinerariesController < ApplicationController
  def new
    @itinerary = current_user.itineraries.new
    @itinerary.event_objects << @planner.events
  end

  def create
    @itinerary = current_user.itineraries.new(itinerary_params)
    @itinerary.event_objects << @planner.events
    if @itinerary.save
      EmailJob.new.perform(current_user, @itinerary)
      session[:planner] = nil
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to create itinerary"
      redirect_to new_itinerary_path
    end
  end

  def show
    @itinerary = current_user.itineraries.where(id: params[:id]).take
    @latlng = Map.latlng(@itinerary.event_objects)
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy_event_objects
    Itinerary.destroy(@itinerary.id)
    redirect_to user_path(current_user.id)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :user_id)
  end
end
