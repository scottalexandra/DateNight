require 'rails_helper'

RSpec.describe User, :type => :model do

  scenario "user is not valid without a name" do
    should validate_presence_of(:name)
  end

  scenario "user is not valid without a provider" do
    should validate_presence_of(:provider)
  end

  scenario "user is not valid without a uid" do
    should validate_presence_of(:uid)
  end

  scenario "user is not valid without an email" do
    should validate_presence_of(:email)
  end

  scenario "user can have many itineraries" do
    should have_many(:itineraries)
  end
end
