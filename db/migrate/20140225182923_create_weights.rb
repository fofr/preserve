class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.datetime :timestamp
      t.string :weight_kg
      t.string :lean_mass_kg
      t.string :fat_mass_kg
      t.string :fat_percent

      t.timestamps
    end
    add_index :weights, :timestamp, :name => 'weight_timestamp_ix'
  end
end
