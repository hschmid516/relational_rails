class CreateLoots < ActiveRecord::Migration[5.2]
  def change
    create_table :loots do |t|
      t.string :name
      t.boolean :memory
      t.integer :armor
      t.timestamps
    end
  end
end
