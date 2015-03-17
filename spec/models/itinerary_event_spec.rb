require 'rails_helper'

RSpec.describe ItineraryEvent, :type => :model do
  scenario "it should belong to an event and an itinerary" do
    should belong_to(:event_object)
    should belong_to(:itinerary)
  end
end
