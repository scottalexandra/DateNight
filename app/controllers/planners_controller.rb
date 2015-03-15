class PlannersController < ApplicationController
  def create
    @event_object = EventObject.create!(title: params[:title],
                       description: params[:description],
                       time: params[:time],
                       place: params[:place],
                       address: params[:address],
                       city: params[:city],
                       state: params[:state],
                       postal_code: params[:postal_code],
                       latitude: params[:latitude],
                       longitude: params[:longitude]
                       )
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
