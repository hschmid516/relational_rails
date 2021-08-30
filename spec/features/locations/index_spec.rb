require 'rails_helper'

RSpec.describe "locations index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    @tarrey = @akkala.locations.create!(name: "Tarrey Town", is_cold: true, korok_seeds: 13)
    @hylia = @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
    @shrine = @great_plateau.locations.create!(name: "Shrine of Resurrection", is_cold: false, korok_seeds: 10)
    visit "/locations"
  end

  it 'can see all locations recorded in the system' do

    expect(page).to have_content(@tarrey.name)
    expect(page).to have_content(@hylia.name)
    expect(page).to have_content("Is Cold: #{@tarrey.is_cold}")
    expect(page).to have_content("Is Cold: #{@hylia.is_cold}")
    expect(page).to have_content("Number of Korok Seeds: #{@tarrey.korok_seeds}")
    expect(page).to have_content("Number of Korok Seeds: #{@hylia.korok_seeds}")
    expect(page).to have_content("Region ID: #{@hylia.region_id}")
    expect(page).to have_content("Created At: #{@hylia.created_at}")
    expect(page).to have_content("Updated At: #{@hylia.updated_at}")
    expect(page).to have_content("Region ID: #{@tarrey.region_id}")
    expect(page).to have_content("Created At: #{@tarrey.created_at}")
    expect(page).to have_content("Updated At: #{@tarrey.updated_at}")
    expect(page).to have_content("ID: #{@hylia.id}")
    expect(page).to have_content("ID: #{@tarrey.id}")
    expect(page).to have_content("Legend of Zelda: Breath of the Wild - Locations")
  end

  it 'has a link to each location' do
    expect(page).to have_link(@tarrey.name)
    expect(page).to have_link(@hylia.name)

    click_link @tarrey.name

    expect(current_path).to eq("/locations/#{@tarrey.id}")

    visit "/locations"

    click_link @hylia.name

    expect(current_path).to eq("/locations/#{@hylia.id}")
  end

  it 'has links to all regions and locations' do
    expect(page).to have_link("All Regions")

    click_link("All Regions")

    expect(current_path).to eq("/regions")
  end

  it 'only shows locations that are cold' do
    expect(page).to_not have_content('Is Cold: false')
    expect(page).to have_content('Is Cold: true')
  end

  it 'can update locations from index page' do
    click_button("Edit #{@tarrey.name}")

    expect(current_path).to eq("/locations/#{@tarrey.id}/edit")
  end

  it 'can delete locations from index page' do
    click_button("Delete #{@tarrey.name}")

    expect(current_path).to eq("/locations")
    expect(page).to_not have_content("#{@tarrey.name}")
  end
end
