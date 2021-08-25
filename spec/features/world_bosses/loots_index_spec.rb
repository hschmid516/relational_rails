require 'rails_helper'

RSpec.describe "Loots shows on individual boss pages", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)
    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)

    visit "/world_bosses/#{@mortanis.id}/loots"
  end

  it 'can see all loots for each boss' do

    expect(page).to have_content(@ring.name)
    expect(page).to have_content("Armor: #{@ring.armor}")
    expect(page).to have_content("Boss ID: #{@ring.world_boss_id}")
    expect(page).to_not have_content(@mu_memory.name)
    expect(page).to_not have_content(@mu_memory.world_boss_id)
  end
end