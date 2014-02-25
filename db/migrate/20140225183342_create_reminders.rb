class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :timestamp
      t.datetime :created_timestamp
      t.string :title
      t.string :notes
      t.string :priority
      t.string :list

      t.timestamps
    end
    add_index :reminders, :timestamp, :name => 'reminder_timestamp_ix'
  end
end
