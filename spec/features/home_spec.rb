require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it 'has links to other pages' do
    visit "/"

    expect(page).to have_content("Welcome!")
    expect(page).to have_link("World of Warcraft: World Bosses")
    expect(page).to have_link("All Loot")
    expect(page).to have_link("Breath of the Wild: Regions")
    expect(page).to have_link("All Locations")
  end
end
