class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.datetime :timestamp
      t.string :headline
      t.string :url

      t.timestamps
    end
    add_index :headlines, :timestamp, :name => 'headline_timestamp_ix'
  end
end
