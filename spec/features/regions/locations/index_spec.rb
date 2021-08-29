require 'rails_helper'

RSpec.describe "locations index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    @hylia = @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 15)
    @tarrey = @akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
    @lomei = @akkala.locations.create!(name: "Lomei Labrynth", is_cold: false, korok_seeds: 5)
    @tower = @akkala.locations.create!(name: "Akkala Tower", is_cold: true, korok_seeds: 1)
    visit "/regions/#{@akkala.id}/locations"
  end

  it 'can see all locations recorded in the system' do
    expect(page).to have_content(@tarrey.name)
    expect(page).to have_content("Is Cold: #{@tarrey.is_cold}")
    expect(page).to have_content("Number of Korok Seeds: #{@tarrey.korok_seeds}")
    expect(page).to have_content("Region ID: #{@tarrey.region_id}")
    expect(page).to have_content("Created At: #{@tarrey.created_at}")
    expect(page).to have_content("Updated At: #{@tarrey.updated_at}")
    expect(page).to have_content(@tarrey.id)
    expect(page).to_not have_content(@hylia.name)
    expect(page).to_not have_content("Number of Korok Seeds: #{@hylia.korok_seeds}")
  end

  it 'has links to all regions and locations' do
    expect(page).to have_link("All Regions")
    expect(page).to have_link("All Locations")

    click_link("All Regions")

    expect(current_path).to eq("/regions")

    visit "/regions/#{@akkala.id}/locations"

    click_link("All Locations")

    expect(current_path).to eq("/locations")
  end

  it "has a link to sort a regions locations" do
    click_link("Sort Locations Alphabetically")

    expect(@tower.name).to appear_before(@lomei.name)
    expect(@lomei.name).to appear_before(@tarrey.name)
  end

  it 'has a form to input a number' do
    fill_in('Korok seeds', with: 6)
    click_button("Only return records with more than 0 Korok Seeds")

    expect(current_path).to eq("/regions/#{@akkala.id}/locations")
    expect(page).to have_content("Tarrey Town")
    expect(page).to_not have_content("Lomei Labrynth")
    expect(page).to_not have_content("Akkala Tower")
  end
end
