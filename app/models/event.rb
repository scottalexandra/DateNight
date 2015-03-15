class Event
  def self.service
    @service ||= EventfulService.new
  end

  def self.find(id)
    _build_object(service.event(id))
  end

  def self.all(keyword="Art", location="Denver", time="Today")
    service.events(keyword, location, time).map do |event|
      _build_object(event)
    end
  end

  def self._build_object(data)
    event = OpenStruct.new(data)
    event.description = sanitized_description(event.description)
    event.start_time = parsed_time(event.start_time)
    event
  end

  def self.sanitized_description(description)
    Nokogiri::HTML(description).text
  end

  def self.parsed_time(time)
    time.strftime("%A, %b, %d, %Y, %I:%M %P")
  end

  def self.search_time(month, day, year)
    "#{month.to_i}/#{day.to_i}/#{year.to_i}"
  end
end
