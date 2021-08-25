class Region < ApplicationRecord
  has_many :locations

  def locations_ordered

  end
end
