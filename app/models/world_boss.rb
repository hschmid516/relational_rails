class WorldBoss < ApplicationRecord
  has_many :loots

  def self.ordered_bosses
    self.order(created_at: :desc)
  end
end
