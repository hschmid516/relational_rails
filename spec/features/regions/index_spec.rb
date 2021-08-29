require 'rails_helper'

RSpec.describe "regions index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    visit "/regions"
  end

  it 'can see all regions recorded in the system' do
    expect(current_path).to eq("/regions")
    expect(page).to have_content(@great_plateau.name)
    expect(page).to have_content(@akkala.name)
    expect(page).to have_content("Legend of Zelda: Breath of the Wild - Regions")
  end

  it 'has a link to each region' do
    expect(page).to have_link(@great_plateau.name)
    expect(page).to have_link(@akkala.name)

    click_link @great_plateau.name

    expect(current_path).to eq("/regions/#{@great_plateau.id}")

    visit "/regions"

    click_link @akkala.name

    expect(current_path).to eq("/regions/#{@akkala.id}")
  end

  it 'shows regions ordered by most recently created' do
    expect(@akkala.name).to appear_before(@great_plateau.name)
  end

  it 'shows created at next to each name' do
    expect(page).to have_content(@great_plateau.created_at)
    expect(page).to have_content(@akkala.created_at)
  end

  it 'has links to all regions and locations' do
    click_link("All Locations")

    expect(current_path).to eq("/locations")
  end

  it 'can update regions from index page' do
    click_button("Edit #{@great_plateau.name}")

    expect(current_path).to eq("/regions/#{@great_plateau.id}/edit")
  end
end
