class EventObject < ActiveRecord::Base
  validates_presence_of :title, :time, :city, :state
  has_many :itinerary_events
  has_many :itineraries, through: :itinerary_events

  attr_reader :quantity

  def add_quantity(quantity)
    @quantity = quantity
  end

  def self.create_event(params)
    EventObject.create!(
      title: params[:title],
      description: params[:description],
      time: params[:time],
      place: params[:place],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      postal_code: params[:postal_code],
      latitude: params[:latitude],
      longitude: params[:longitude]
      )
  end
end
