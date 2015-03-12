class PlannersController < ApplicationController
  def create
    @planner.add_event(params[:event_id])
    session[:planner] = @planner.data
    redirect_to :back
  end

  def destroy
    @planner.remove_event(params[:event_id])
    session[:planner] = @planner.data
    redirect_to new_itinerary_path
  end
end
