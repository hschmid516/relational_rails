require 'rails_helper'

describe Region, type: :model do
  it {should have_many :locations}

  before(:each) do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
  end

  it 'has locations ordered by name' do
    expected = [@akkala, @great_plateau]
    expect(Region.ordered_regions).to eq(expected)
  end
end
