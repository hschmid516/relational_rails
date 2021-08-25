require 'rails_helper'

RSpec.describe "locations index page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
    @tarrey = @akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
    @hylia = @great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
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
    expect(page).to_not have_content("Is Cold: #{@hylia.is_cold}")
    expect(page).to_not have_content("Number of Korok Seeds: #{@hylia.korok_seeds}")
  end
end
