class PlannersController < ApplicationController
  def create
    @event_object = EventObject.create_event(params)
    @planner.add_event(@event_object.id)
    session[:planner] = @planner.data
    redirect_to :back
  end

  def destroy
    @planner.remove_event(params[:event_id])
    session[:planner] = @planner.data
    redirect_to new_itinerary_path
  end
end
