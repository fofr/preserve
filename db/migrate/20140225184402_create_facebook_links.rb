class CreateFacebookLinks < ActiveRecord::Migration
  def change
    create_table :facebook_links do |t|
      t.datetime :timestamp
      t.string :title
      t.string :link
      t.text :description
      t.text :message
      t.string :from

      t.timestamps
    end
    add_index :facebook_links, :timestamp, :name => 'facebook_link_timestamp_ix'
  end
end
