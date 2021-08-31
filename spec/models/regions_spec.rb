require 'rails_helper'

describe Region, type: :model do
  it { should have_many :locations }

  before(:each) do
    @great_plateau = Region.create!(name: 'The Great Plateau', has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: 'Akkala', has_divine_beast: false, shrines: 8)
    @hylia = @great_plateau.locations.create!(name: 'Mount Hylia', is_cold: true, korok_seeds: 11)
    @temple = @great_plateau.locations.create!(name: 'Temple of Time', is_cold: true, korok_seeds: 8)
    @shrine = @great_plateau.locations.create!(name: 'Shrine of Resurrection', is_cold: true, korok_seeds: 4)
    @tarrey = @akkala.locations.create!(name: 'Tarrey Town', is_cold: true, korok_seeds: 13)
  end

  it 'has regions ordered by created at' do
    expect(Region.ordered_regions(nil)).to eq([@akkala, @great_plateau])
  end

  it 'counts the number of locations for a region' do
    expect(@great_plateau.location_count).to eq(3)
  end

  it 'puts locations in alphabetical order' do
    expect(@great_plateau.ordered_locations).to eq([@hylia, @shrine, @temple])
  end

  it 'finds locations with minimum number of koroks' do
    expect(@great_plateau.min_koroks(5)).to eq([@hylia, @temple])
  end

  it 'sorts regions by number of locations' do
    expect(Region.ordered_regions('locations')).to eq([@great_plateau, @akkala])
  end

  it 'searches for region by exact name' do
    expect(Region.exact_search(@great_plateau.name)).to eq([@great_plateau])
  end

  it 'searches for region by partial name' do
    expect(Region.partial_search('Great')).to eq([@great_plateau])
  end
end
