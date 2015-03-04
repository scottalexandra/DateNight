class RemoveColumnFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :image, :string
  end
end
