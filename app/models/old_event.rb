class Event < ActiveRecord::Base
  validates_presence_of :title, :time, :city, :state
  has_many :itinerary_events
  has_many :itineraries, through: :itinerary_events

  attr_reader :quantity

  def self.search(query)
    where("city like ?", "%#{query.capitalize}")
  end

  def add_quantity(quantity)
    @quantity = quantity
  end

  def formatted_time(time)
    DateTime.parse(time)
  end
end