class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|
      t.string :venue
      t.string :description
      t.string :longitude
      t.string :latitude
      t.string :foursquare_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
