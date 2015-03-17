class EventfulService
  attr_reader :connection

  def initialize
    @connection = Eventful::API.new 'DdBNfvmp5tfQ7zGr'
  end

  def events(keyword="art", location="Denver", time="Today")
    events = connection.call('events/search',
                             :keywords => keyword,
                             :location => location,
                             :t => time,
                             :page_size => 10
                             )
    events["events"]["event"]
  end

  def event(id)
    event = connection.call('events/get', :id => id )
  end
end
