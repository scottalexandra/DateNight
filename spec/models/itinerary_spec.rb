require 'rails_helper'

RSpec.describe Itinerary, :type => :model do
  scenario "it is not valid without a unique title" do
    should validate_presence_of(:title)
    should validate_uniqueness_of(:title)
  end

  scenario "it is not valid without a description" do
    should validate_presence_of(:description)
  end

  scenario "it has many events through itinerary-events" do
    should have_many(:event_objects).through(:itinerary_events)
  end

  scenario "it is not valid without a user" do
    should belong_to(:user)
  end
end
