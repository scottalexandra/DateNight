class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :title
      t.string :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :itineraries, :users
  end
end
