class Loot < ApplicationRecord
  belongs_to :world_boss

  def self.show_true
    where(memory: true)
  end

  scope :exact_search, ->(search) {where(name: search) if search != nil}
  scope :partial_search, ->(search) { where("name ilike ?", "%#{search}%") if search != nil}
end
