require 'rails_helper'

describe Location, type: :model do
  it { should belong_to :region }

  before(:each) do
    @great_plateau = Region.create!(name: 'The Great Plateau', has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: 'Akkala', has_divine_beast: false, shrines: 8)
    @hylia = @great_plateau.locations.create!(name: 'Mount Hylia', is_cold: true, korok_seeds: 11)
    @temple = @great_plateau.locations.create!(name: 'Temple of Time', is_cold: true, korok_seeds: 8)
    @shrine = @great_plateau.locations.create!(name: 'Shrine of Resurrection', is_cold: true, korok_seeds: 4)
    @tarrey = @akkala.locations.create!(name: 'Tarrey Town', is_cold: true, korok_seeds: 13)
  end

  it 'searches for location by exact name' do
    expect(Location.exact_search(@hylia.name)).to eq([@hylia])
  end

  it 'searches for location by partial name' do
    expect(Location.partial_search('hyl')).to eq([@hylia])
  end
end
