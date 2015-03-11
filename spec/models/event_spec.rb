require 'rails_helper'

RSpec.describe Event, :type => :model do
  scenario "it is not valid without a title" do
    should validate_presence_of(:title)
  end

  scenario "it is not valid without a time" do
    should validate_presence_of(:time)
  end

  scenario "it is not valid without a city" do
    should validate_presence_of(:city)
  end

  scenario "it is not valid without a state" do
    should validate_presence_of(:state)
  end

  scenario "it belongs to many itineraries through itinerary events" do
    should have_many(:itineraries).through(:itinerary_events)
  end
end
