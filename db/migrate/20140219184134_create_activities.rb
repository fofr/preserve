class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_class
      t.integer :activity_id
      t.date :date

      t.timestamps
    end
  end
end
