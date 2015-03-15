class ItineraryEvent < ActiveRecord::Base
  belongs_to :event_object
  belongs_to :itinerary
end
