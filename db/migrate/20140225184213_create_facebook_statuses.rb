class CreateFacebookStatuses < ActiveRecord::Migration
  def change
    create_table :facebook_statuses do |t|
      t.datetime :timestamp
      t.text :message

      t.timestamps
    end
    add_index :facebook_statuses, :timestamp, :name => 'facebook_status_timestamp_ix'
  end
end
