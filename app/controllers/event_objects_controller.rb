class EventObjectsController < ApplicationController
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
    redirect_to :back
  end
end
