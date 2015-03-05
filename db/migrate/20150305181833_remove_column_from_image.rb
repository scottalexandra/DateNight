class RemoveColumnFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :event_id, :integer
  end
end
