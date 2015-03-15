class RenameEventToEventObject < ActiveRecord::Migration
  def change
    rename_table :events, :event_objects
  end
end
