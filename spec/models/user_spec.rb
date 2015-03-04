require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @user = User.create(uid:"11231254662",
                        provider: "google",
                        name: "Alexandra Robinson",
                        email: "alexandra.scott335@gmail.com")
  end
  scenario "user is not valid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
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
