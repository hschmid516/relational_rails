class Region < ApplicationRecord
  has_many :locations, dependent: :delete_all

  def self.ordered_regions
    order(created_at: :desc)
  end

  def location_count
    locations.count
  end

  def ordered_locations
    locations.order(:name)
  end

  def min_koroks(koroks)
    koroks = 0 if koroks == nil 
    locations.where("korok_seeds > #{koroks}")
  end
end
