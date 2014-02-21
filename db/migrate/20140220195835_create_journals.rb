class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.text :text
      t.string :journal_id
      t.datetime :timestamp

      t.timestamps
    end
    add_index :journals, :timestamp, :name => 'journal_timestamp_ix'
  end
end
