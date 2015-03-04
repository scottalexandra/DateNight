class AddColumnToImage < ActiveRecord::Migration
  def change
    add_reference :images, :event, index: true
    add_foreign_key :images, :events
  end
end
