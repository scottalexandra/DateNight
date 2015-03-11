require "rails_helper"

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

  scenario "can add an event to an itinerary" do
    
  end

end
