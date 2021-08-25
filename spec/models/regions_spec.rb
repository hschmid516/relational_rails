require 'rails_helper'

describe Region, type: :model do
  it {should have_many :locations}

  before(:each) do
    @the_great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
  end

  # it 'has locations ordered by name' do
  #   expected = ['fdsfsd', 'fdsfs'] #or objects
  #   expect(@the_great_plateau.locations_ordered).to eq(expected)
  # end
end
