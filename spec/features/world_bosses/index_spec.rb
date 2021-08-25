require 'rails_helper'

RSpec.describe "Bosses index page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
    visit "/world_bosses"
  end

  it 'can see all world bosses recorded in the system' do

    expect(current_path).to eq("/world_bosses")
    expect(page).to have_content(@mortanis.name)
    expect(page).to have_content(@muckformed.name)
    expect(page).to have_content("World of Warcraft(Shadowlands) World Bosses")
  end

  it 'has a link to each world boss' do
    expect(page).to have_link(@mortanis.name)
    expect(page).to have_link(@muckformed.name)

    click_link @mortanis.name
    expect(current_path).to eq("/world_bosses/#{@mortanis.id}")


    visit "/world_bosses"

    click_link @muckformed.name
    expect(current_path).to eq("/world_bosses/#{@muckformed.id}")

  end
end
