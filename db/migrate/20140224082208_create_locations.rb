class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :direction
      t.datetime :timestamp
      t.string :name

      t.timestamps
    end
  end
end
