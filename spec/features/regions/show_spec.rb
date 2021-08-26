require 'rails_helper'

RSpec.describe "Regions show page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: true, shrines: 8)
    @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
    @akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
    @akkala.locations.create!(name: "Lomei Labrynth", is_cold: false, korok_seeds: 5)
    visit "/regions/#{@great_plateau.id}"
  end

  it 'displays the region name' do
    expect(page).to have_content(@great_plateau.name)
    expect(page).to have_content(@great_plateau.has_divine_beast)
    expect(page).to have_content(@great_plateau.shrines)
    expect(page).to_not have_content(@akkala.name)
    expect(page).to_not have_content(@akkala.has_divine_beast)
    expect(page).to_not have_content(@akkala.shrines)
  end

  it 'displays county of number of children for each parent' do
    expect(page).to have_content("Number of Locations: 1")
  end
end
