class Event
  def self.service
    @service ||= EventfulService.new
  end

  def self.find(id)
    event = service.event(id)
    _format_object(event)
  end

  def self.all(keyword="Art", location="Denver", time="Today")
    events = service.events(keyword, location, time)
    if events.event.class == Array
      events.event.map { |event| _format_object(event) }
    elsif events.event
      _format_object(events.event)
    else
      _format_object(events)
    end
  end

  def self._format_object(raw_event)
    if raw_event.present?
      raw_event.description = sanitized_description(raw_event.description)
      raw_event.start_time = parsed_time(raw_event.start_time)
      raw_event
    else
      "no events found"
    end
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
