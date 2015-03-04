class Itinerary < ActiveRecord::Base
  validates_presence_of :title, :description
  validates :title, uniqueness: true
  belongs_to :user
  has_many :itinerary_events
  has_many :events, through: :itinerary_events
end
