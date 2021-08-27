class Region < ApplicationRecord
  has_many :locations

  def self.ordered_regions
    order(created_at: :desc)
  end

  def location_count
    locations.count
  end
end
