require 'rails_helper'

RSpec.describe "regions index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
  end

  it 'can see all regions recorded in the system' do
    visit "/regions"

    expect(current_path).to eq("/regions")
    expect(page).to have_content(@great_plateau.name)
    expect(page).to have_content(@akkala.name)
    expect(page).to have_content("Legend of Zelda: Breath of the Wild - Regions")
  end
end
