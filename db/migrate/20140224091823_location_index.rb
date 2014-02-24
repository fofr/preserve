class LocationIndex < ActiveRecord::Migration
  def change
    add_index :locations, :timestamp, :name => 'location_timestamp_ix'
  end
end
