class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.boolean :is_cold
      t.integer :korok_seeds
      t.string :name
      t.timestamps
    end
  end
end
