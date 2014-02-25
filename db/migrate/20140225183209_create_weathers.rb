class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :timestamp
      t.string :todays_condition
      t.string :high_temp_celsius
      t.string :low_temp_celsius
      t.string :current_temp_celsius
      t.string :current_condition
      t.string :wind_speed_mph
      t.string :wind_direction
      t.string :pollen_count
      t.string :uv_index
      t.string :humidity
      t.datetime :sunrise
      t.datetime :sunset

      t.timestamps
    end
    add_index :weathers, :timestamp, :name => 'weather_timestamp_ix'
  end
end
