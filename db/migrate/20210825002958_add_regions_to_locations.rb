class AddRegionsToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :region, foreign_key: true
  end
end
