class Loot < ApplicationRecord
  belongs_to :world_boss

  def self.show_true
    Loot.where(memory: true)
  end
end
