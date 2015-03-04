class AddColumnToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :status, :string, default: "upcoming" 
  end
end
