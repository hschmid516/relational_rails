require 'rails_helper'

RSpec.describe "regions index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    @tarrey = @akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
    @hylia = @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
  end

  it 'can see all regions recorded in the system' do
    visit "/locations"

    expect(current_path).to eq("/locations")
    expect(page).to have_content(@tarrey.name)
    expect(page).to have_content(@hylia.name)
    expect(page).to have_content(@tarrey.is_cold)
    expect(page).to have_content(@hylia.is_cold)
    expect(page).to have_content(@tarrey.korok_seeds)
    expect(page).to have_content(@hylia.korok_seeds)
    expect(page).to have_content(@hylia.region_id)
    expect(page).to have_content(@hylia.created_at)
    expect(page).to have_content(@hylia.updated_at)
    expect(page).to have_content(@tarrey.region_id)
    expect(page).to have_content(@tarrey.created_at)
    expect(page).to have_content(@tarrey.updated_at)
    expect(page).to have_content(@hylia.id)
    expect(page).to have_content(@tarrey.id)
    expect(page).to have_content("Legend of Zelda: Breath of the Wild - Locations")
  end
end
