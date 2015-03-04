class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :time
      t.string :place
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :image
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
