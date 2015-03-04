require 'rails_helper'

RSpec.describe Image, :type => :model do
  scenario "is not valid without a url" do
    should validate_presence_of(:url)
  end

  scenario "it belongs to an event" do
    should belong_to(:event)
  end
end
