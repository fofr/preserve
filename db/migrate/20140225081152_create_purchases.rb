class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :amount
      t.string :name
      t.string :description
      t.datetime :timestamp

      t.timestamps
    end
    add_index :purchases, :timestamp, :name => 'purchase_timestamp_ix'
  end
end
