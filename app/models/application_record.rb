class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :exact_search, ->(search) { where(name: search) unless search.nil? }

  scope :partial_search, ->(search) { where('name ilike ?', "%#{search}%") unless search.nil? }
end
