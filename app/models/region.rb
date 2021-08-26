class Region < ApplicationRecord
  has_many :locations

  def self.ordered_regions
    self.order(created_at: :desc)
  end
end
