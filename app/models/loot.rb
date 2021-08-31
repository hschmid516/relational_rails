class Loot < ApplicationRecord
  belongs_to :world_boss

  def self.show_true
    where(memory: true)
  end
end
