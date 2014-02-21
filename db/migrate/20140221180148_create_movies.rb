class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :imdb_id
      t.datetime :timestamp
      t.integer :year

      t.timestamps
    end
    add_index :movies, :timestamp, :name => 'movies_timestamp_ix'
  end
end
