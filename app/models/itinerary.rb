class Itinerary < ActiveRecord::Base
  validates_presence_of :title, :description
  validates :title, uniqueness: true
  belongs_to :user
  has_many :itinerary_events
  has_many :event_objects, through: :itinerary_events

  def destroy_event_objects
    event_objects.destroy_all
  end
end
