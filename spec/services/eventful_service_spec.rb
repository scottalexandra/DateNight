require 'spec_helper'

describe "evenful service" do
  before(:each) do
    @service = EventfulService.new
  end

  it "returns a list of events" do
    VCR.use_cassette('eventful_service_events') do
      events = @service.events
      first_event = events.first

      expect(first_event['region_abbr']).to eq('CO')
      expect(events.count).to eq(10)
    end
  end

  it "returns a list of events based on the search params" do
    VCR.use_cassette('eventful_service_filtered_events') do 
      events = @service.events("music","Colorado Springs","3/17/2015" )
      first_event = events.first

      expect(first_event['region_abbr']).to eq('CO')
      expect(first_event['city_name']).to eq('Colorado Springs')
    end
  end

  it "returns a specific event" do
    VCR.use_cassette('eventful_service_event') do
      event = @service.events(1).first

      expect(event['region_abbr']).to eq('CO')
      expect(event['postal_code']).to eq(80112)
    end
  end
end
