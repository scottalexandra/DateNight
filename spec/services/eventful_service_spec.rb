require 'spec_helper'

describe "evenful service" do
  before(:each) do
    @service = EventfulService.new
  end

  it "returns a list of events" do
    events = @service.events
    first_event = events.first
    expect(first_event['region_abbr']).to eq('CO')
  end
end
