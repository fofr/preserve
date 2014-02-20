class AddIndexToActivities < ActiveRecord::Migration
  def change
    add_index :scrobbles, :timestamp, :name =>  'scrobble_timestamp_ix'
    add_index :tweets, :timestamp, :name =>     'tweets_timestamp_ix'
    add_index :foursquares, :timestamp, :name => 'foursquare_timestamp_ix'
  end
end
