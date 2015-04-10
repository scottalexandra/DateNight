require 'rails_helper'

RSpec.describe EventfulService do
  before(:each) { @service = EventfulService.new }

  it "returns a list of events" do
    VCR.use_cassette('eventful_service_events') do
      events = @service.events
      first_event = events.event.first

      expect(first_event.region_abbr).to eq('CO')
      expect(events.event.count).to eq(10)
    end
  end

  it "returns a list of events that contains only one event" do
    VCR.use_cassette('eventful_service_one_event') do
      events = @service.events
      event = events.event
      expect(event.region_abbr).to eq('CO')
    end

  end

  it "returns a list of events based on the search params" do
    VCR.use_cassette('eventful_service_filtered_events') do
      events = @service.events("music",
                               "Colorado Springs",
                               "3/17/2015")
      first_event = events.event.first

      expect(first_event.region_abbr).to eq('CO')
      expect(first_event.city_name).to eq('Colorado Springs')
    end
  end

  it "returns a specific event" do
    VCR.use_cassette('eventful_service_event') do
      event = Hashie::Mash.new(@service.event("E0-001-079718724-6"))
      expect(event.region_abbr).to eq('CO')
      expect(event.postal_code).to eq(80010)
    end
  end
end
