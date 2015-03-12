class EventfulService
  def initalize
    @connection = Faraday.new(url: "http://eventful.com")
  end

  def events
    parse(connection.get("events"))
  end

  def event
    parse(connection.get("events/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
