class CreateRegion < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.timestamps
      t.boolean :has_divine_beast
      t.integer :shrines
      t.string :name
    end
  end
end
