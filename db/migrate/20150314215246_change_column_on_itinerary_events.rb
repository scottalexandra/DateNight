class ChangeColumnOnItineraryEvents < ActiveRecord::Migration
  def change
    rename_column :itinerary_events, :event_id, :event_object_id
  end
end
