class AddColumnToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :image, index: true
    add_foreign_key :events, :images
  end
end
