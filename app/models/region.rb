class Region < ApplicationRecord
  has_many :locations, dependent: :delete_all

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

  def self.ordered_regions(sort)
    if sort == 'locations'
      left_joins(:locations).group(:id).order('locations.count DESC')
    else
      order(created_at: :desc)
    end
  end

  scope :exact_search, ->(search) { where(name: search) if search != nil}

  scope :partial_search, ->(search) { where("name ilike ?", "%#{search}%") if search != nil}
end
