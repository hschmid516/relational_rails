class CreateWorldBoss < ActiveRecord::Migration[5.2]
  def change
    create_table :world_bosses do |t|
      t.timestamps
      t.string :name
      t.integer :max_health
      t.boolean :is_current_boss
      t.string :zone
    end
  end
end
