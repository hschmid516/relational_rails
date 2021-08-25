class AddWorldBossesToLoots < ActiveRecord::Migration[5.2]
  def change
    add_reference :loots, :world_boss, foreign_key: true
  end
end
