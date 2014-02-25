class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.datetime :timestamp
      t.string :url
      t.string :source_url
      t.text :caption

      t.timestamps
    end
    add_index :instagrams, :timestamp, :name => 'instagram_timestamp_ix'
  end
end
