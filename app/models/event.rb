class Event < ActiveRecord::Base
  validates_presence_of :title, :time, :city, :state
  has_many :itinerary_events
  has_many :itineraries, through: :itinerary_events


  def self.search(query)
    where("city like ?", "%#{query}")
  end
end
