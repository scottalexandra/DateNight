require 'rails_helper'

describe "authenticated user" do
  before(:each) do
    @user = User.create(provider: "google_oauth2",
                        name: "Murphy Robinson",
                        email: "murphy.robinson3@gmail.com",
                        uid: "123127235098235")
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(@user)
  end

  scenario "can login and visit the events index page" do
    visit events_path
    within(".events-list") do
      expect(page).to have_content("Explore All The Happenings")
    end
  end
end
