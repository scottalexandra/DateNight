require "rails_helper"

RSpec.describe Event do

  it "returns an event" do
    VCR.use_cassette("find_event") do
      event = Event.find("E0-001-079718724-6")
      expect(event.region_abbr).to eq("CO")
    end
  end

  it "returns a list of multiple events" do
    VCR.use_cassette("all_events") do
      events = Event.all
      first_event = events.first
      expect(first_event.region_abbr).to eq("CO")
    end
  end

  it "returns a list with one event" do
    VCR.use_cassette("all_events_is_one_event") do
      event = Event.all
      expect(event.region_abbr).to eq("CO")
    end
  end

  it "returns an error message when no events are found" do
    VCR.use_cassette("no_events_found") do
      events = Event.all("music", "dener", "3/17/2015")
      expect(events).to eq("no events found")
    end
  end
end
