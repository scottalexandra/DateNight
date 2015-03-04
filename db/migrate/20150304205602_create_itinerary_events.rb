class CreateItineraryEvents < ActiveRecord::Migration
  def change
    create_table :itinerary_events do |t|
      t.references :event, index: true
      t.references :itinerary, index: true

      t.timestamps null: false
    end
    add_foreign_key :itinerary_events, :events
    add_foreign_key :itinerary_events, :itineraries
  end
end
