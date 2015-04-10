class EventfulService
  attr_reader :connection

  def initialize
    @connection = Eventful::API.new ENV['EVENTFUL_API_KEY']
  end

  def events(keyword="art", location="Denver", time="Today")
    parse_events(connection.call('events/search',
                                 :keywords => keyword,
                                 :location => location,
                                 :t => time,
                                 :page_size => 100
                                 ))
  end

  def event(id)
    parse_event(connection.call('events/get', :id => id ))
  end

  def parse_events(events)
    Hashie::Mash.new(events["events"])
  end

  def parse_event(event)
    Hashie::Mash.new(event)
  end
end
