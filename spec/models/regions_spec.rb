require 'rails_helper'

describe Region, type: :model do
  it {should have_many :locations}

  before(:each) do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    @hylia = @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
    @temple = @great_plateau.locations.create!(name: "Temple of Time", is_cold: true, korok_seeds: 8)
    @shrine = @great_plateau.locations.create!(name: "Shrine of Resurrection", is_cold: true, korok_seeds: 4)
  end

  it 'has locations ordered by name' do
    expected = [@akkala, @great_plateau]
    expect(Region.ordered_regions).to eq(expected)
  end

  it "counts the number of locations for a region" do
    expect(@great_plateau.location_count).to eq(3)
  end

  it "puts locations in alphabetical order" do
    expect(@great_plateau.ordered_locations).to eq([@hylia, @shrine, @temple])
  end

  it "finds locations with minimum number of koroks" do
    expect(@great_plateau.min_koroks(5)).to eq([@hylia, @temple])
  end
end
