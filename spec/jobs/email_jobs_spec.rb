describe EmailJob, job: true do
  describe "#perform" do
    before(:each) do
      @user = User.create(provider: "google_oauth2",
                          name: "Murphy Robinson",
                          email: "murphy.robinson3@gmail.com",
                          uid: "123127235098235")
      @event = EventObject.create(title: "Best Event Ever",
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
      @itinerary = @user.itineraries.create(title: "Date Night", description: "Fun Fun Fun")
      @itinerary.event_objects << @event
    end

    it "sends an email" do
      expect {
        EmailJob.new.perform(@user, @itinerary)
      }.to change{ ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
