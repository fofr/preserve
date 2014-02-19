class CreateScrobbles < ActiveRecord::Migration
  def change
    create_table :scrobbles do |t|
      t.datetime :timestamp
      t.string :track
      t.string :artist
      t.string :album
      t.string :uncorrected_track
      t.string :uncorrected_artist
      t.string :album_artist
      t.string :application
      t.string :scrobble_id

      t.timestamps
    end
  end
end
