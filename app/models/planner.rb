class Planner
  attr_reader :data

  def initialize(data)
    @data = data || Hash.new
  end

  def add_event(event_object_id)
    @data[event_object_id] ||= 0
    @data[event_object_id] += 1
  end

  def count(data)
    data.values.reduce(0, :+)
  end

  def remove_event(event_object_id)
    @data[event_object_id] -= 1
    @data.delete_if { |_event, quantity| quantity == 0 }
  end

  def events
    events = []
    data.each do |event_object_id, quantity|
      event = EventObject.find(event_object_id.to_i)
      event.add_quantity(quantity)
      events << event
    end
    events
  end
end
