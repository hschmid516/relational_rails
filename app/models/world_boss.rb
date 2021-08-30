class WorldBoss < ApplicationRecord
  has_many :loots, dependent: :delete_all

  def self.ordered_bosses
    order(created_at: :desc)
  end

  def loot_count
    loots.count
  end

  def sort_loots(sort = false)
    if sort
      loots.order(:name)
    else
      loots
    end
  end

  def min_armor(armor)
    armor = 0 if armor == nil
    loots.where("armor > #{armor}")
  end
end
