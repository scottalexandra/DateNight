require 'rails_helper'

describe "authenticated user" do
  before(:each) do
    @user = User.create(provider: "google_oauth2",
                        name: "Murphy Robinson",
                        email: "murphy.robinson3@gmail.com",
                        uid: "123127235098235")
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(@user)
    @event = Event.create(title: "Best Event Ever",
                          url: "www.myevent.com",
                          description: "This is the best event ever",
                          time: "May 2, 2015 3pm",
                          place: "Red Rocks Ampitheatre",
                          address: "9990 Bronti Cir",
                          city: "Morrison",
                          state: "Colorado",
                          postal_code: "82314",
                          country: "USA",
                          latitude: "39.749",
                          longitude: "-105.000",
                          image: "event-image.jpg"
                          )
    @event1 = Event.create(title: "Second Best Event Ever",
                           url: "www.myevent.com",
                           description: "This is the second best event ever",
                           time: "May 3, 2015 4pm",
                           place: "Red Rocks Ampitheatre",
                           address: "10051 Park Meadows Dr.",
                           city: "Boulder",
                           state: "Colorado",
                           postal_code: "87775",
                           country: "USA",
                           latitude: "47.821",
                           longitude: "-106.0009",
                           image: "event-image.jpg"
                           )
  end

  scenario "can login and visit the events index page" do
    visit events_path
    within(".events-list") do
      expect(page).to have_content("Explore All The Happenings")
    end
  end

  scenario "can login a view details of a specific event" do
    visit events_path

    within(".events-list") do
      click_link_or_button "Best Event Ever"
    end

    expect(current_path).to eq(event_path(@event.id))

    within(".event-title") do
      expect(page).to have_content("Best Event Ever")
    end

    within(".event-description") do
      expect(page).to have_content("This is the best event ever")
    end

    within(".event-time") do
      expect(page).to have_content("May 02, 2015")
    end

    within(".event-place") do
      expect(page).to have_content("Red Rocks Ampitheatre")
    end

    within(".event-address") do
      expect(page).to have_content("9990 Bronti Cir")
    end

    within(".event-city-state-zip") do
      expect(page).to have_content("Morrison, Colorado 82314")
    end
  end

  scenario "can sort events by city" do
    visit events_path
    within(".events-list") do
      expect(page).to have_content("Best Event Ever")
      expect(page).to have_content("Second Best Event Ever")
    end
    fill_in "search", with: "Boulder"
    find("#search_form").find("button").click
    within(".events-list") do
      expect(page).to have_content("Second Best Event Ever")
    end
  end
end
