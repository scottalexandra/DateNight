class EventObjectsController < ApplicationController
  def create
    @event_object = EventObject.create_event(params)
    @planner.add_event(@event_object.id)
    redirect_to :back
  end
end
