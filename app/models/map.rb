class Map
  def self.latlng(events)
    Gmaps4rails.build_markers(events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end
end
