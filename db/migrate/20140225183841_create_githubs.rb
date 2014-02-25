class CreateGithubs < ActiveRecord::Migration
  def change
    create_table :githubs do |t|
      t.datetime :timestamp
      t.string :title
      t.string :url
      t.string :author

      t.timestamps
    end
    add_index :githubs, :timestamp, :name => 'github_timestamp_ix'
  end
end
