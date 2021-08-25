require 'rails_helper'

describe Region, type: :model do
  before(:each) do
    @the_great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
  end

# tested by activerecord
  # it 'exists and has attributes' do
  #   expect(@the_great_plateau).to be_a(Region)
  #   expect(@the_great_plateau.name).to eq("The Great Plateau")
  #   expect(@the_great_plateau.has_divine_beast).to eq(false)
  #   expect(@the_great_plateau.shrines).to eq(4)
  # end

  it 'has locations ordered by name' do
    expected = ['fdsfsd', 'fdsfs'] #or objects
    expect(@the_great_plateau.locations_ordered).to eq(expected)
  end
end
