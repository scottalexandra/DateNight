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
    visit events_path
    click_link_or_button "Best Event Ever"
    within(".add-to-itinerary") do
      click_link_or_button "Add To Itinerary"
    end
  end

  scenario "can add an event to the date planner" do
    within(".date-planner-btn") do
      click_link_or_button "DatePlanner"
    end
    within(".itinerary-events-list") do
      expect(page).to have_content("Best Event Ever")
    end
  end

  xscenario "Can view the details of their itinerary" do
    within(".date-planner-btn") do
      click_link_or_button "DatePlanner"
    end
    within(".itinerary-events-list") do
      expect(page).to have_content("Best Event Ever")
      expect(page).to have_link("Remove Event")
    end
    expect(page).to have_css("#itinerary-map")
    expect(page).to have_link("Save")
  end

  xscenario "can save an itinerary" do
    within(".date-planner-btn") do
      click_link_or_button "DatePlanner"
    end
    within(".itinerary-events-list") do
      expect(page).to have_content("Best Event Ever")
      expect(page).to have_link("Remove Event")
    end
    within(".itinerary-details") do
      fill_in "itinerary[title]", with: "Ed Sheeran Concert Date Night"
      fill_in "itinerary[description]", with: "Going to Ed Sheeran Concert and dinner!"
      click_link_or_button "Save"
    end
    expect(current_path).to eq(user_path(current_user.id))
    within(".upcoming-dates") do
      expect(page).to have_content("Going to Ed Sheeran Concert Date Night")
    end
  end

  xscenario "can view an upcoming date itinerary" do
    within(".date-planner-btn") do
      click_link_or_button "DatePlanner"
    end
    within(".itinerary-events-list") do
      expect(page).to have_content("Best Event Ever")
      expect(page).to have_link("Remove Event")
    end
    within(".itinerary-details") do
      fill_in "itinerary[title]", with: "Ed Sheeran Concert Date Night"
      fill_in "itinerary[description]", with: "Going to Ed Sheeran Concert and dinner!"
      click_link_or_button "Save"
    end
    within(".upcoming-dates") do
      click_link_or_button  "Ed Sheeran Concert Date Night"
      within(".itinerary info") do
        expect(page).to have_content("description: Going to Ed Sheeran Concert and dinner!")
        expect(page).to have_content("address: 9990 Bronti Cir")
        expect(page).to have_content("time: May 2, 2015 3pm")
        expect(page).to have_button("edit itinerary")
      end
    end
  end

end
