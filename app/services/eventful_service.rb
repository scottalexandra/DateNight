class EventfulService
  attr_reader :connection

  def initialize
    @connection = Eventful::API.new 'DdBNfvmp5tfQ7zGr'
  end

  def events
    events = connection.call('events/search', :keywords => "music", :location => "Denver", :t => "Next 30 days", :page_size => 2)
    if events.count == 1
      Array.new(events["events"]["event"])
    else
      events["events"]["event"]
    end
  end

  # def event
    # parse(connection.get("events/#{id}"))
  # end

  private

  # def parse(response)
    # JSON.parse(response.body)
  # end
end
