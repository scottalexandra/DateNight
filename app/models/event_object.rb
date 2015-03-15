class EventObject < ActiveRecord::Base
  validates_presence_of :title, :time, :city, :state
  has_many :itinerary_events
  has_many :itineraries, through: :itinerary_events

  attr_reader :quantity

  def add_quantity(quantity)
    @quantity = quantity
  end
end
