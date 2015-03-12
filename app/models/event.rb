class Event
  def self.service
    @service ||= EventfulService.new
  end

  def self.find(id)
    _build_object(service.event(id))
  end

  def self.all
    service.events.map do |event|
      _build_object(event)
    end
  end

  def self._build_object(data)
    event = OpenStruct.new(data)
    event.description = sanitized_description(event.description)
    event
  end

  def self.sanitized_description(description)
    Nokogiri::HTML(description).text
  end

end
