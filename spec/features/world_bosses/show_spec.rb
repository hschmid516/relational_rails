require 'rails_helper'

RSpec.describe "Bosses show page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)
    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)

    visit "/world_bosses/#{@mortanis.id}"
  end

  it 'displays the boss name and attributes' do

    expect(page).to have_content(@mortanis.name)
    expect(page).to have_content("Max Health: #{@mortanis.max_health}")
    expect(page).to have_content("Current World Boss? #{@mortanis.is_current_boss}")
    expect(page).to have_content("Zone: #{@mortanis.zone}")
    expect(page).to_not have_content("Zone: #{@muckformed.zone}")
    expect(page).to_not have_content(@muckformed.name)
  end

  it 'shows count of loot for each boss' do
    expect(page).to have_content("Pieces of loot: 3")
  end
end
