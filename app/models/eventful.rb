class Eventful
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

  def _build_object(data)
    OpenStruct.new(data)
  end
end
