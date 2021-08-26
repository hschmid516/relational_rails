class WorldBoss < ApplicationRecord
  has_many :loots

  def self.ordered_bosses
    order(created_at: :desc)
  end

  def loot_count
    loots.count
  end
end
