require 'rails_helper'

RSpec.describe "Bosses index page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:100_000_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:90_000_000, is_current_boss: false, zone: "Revendreth")
  end

  it 'can see all world bosses recorded in the system' do
    visit "/world_bosses"

    expect(current_path).to eq("/world_bosses")
    expect(page).to have_content(@mortanis.name)
    expect(page).to have_content(@muckformed.name)
    expect(page).to have_content("World of Warcraft(Shadowlands) World Bosses")
  end
end
