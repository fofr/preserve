class CreateFlickrs < ActiveRecord::Migration
  def change
    create_table :flickrs do |t|
      t.datetime :timestamp
      t.string :title
      t.string :flickr_url
      t.text :description
      t.datetime :taken_timestmap
      t.string :original_source_url
      t.string :source_url
      t.string :tags

      t.timestamps
    end
    add_index :flickrs, :timestamp, :name => 'flickr_timestamp_ix'
  end
end
