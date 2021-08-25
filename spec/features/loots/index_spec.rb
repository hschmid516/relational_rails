require 'rails_helper'

RSpec.describe "Loots has an index page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)

    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
    @feet = @muckformed.loots.create!(name: "Jingling Stone Stompers", memory: false, armor: 82)
    @gloves = @muckformed.loots.create!(name: "Hardened Castle Crusher", memory: false, armor: 21)
    visit "/loots"

  end

  it 'can see all loots recorded in the system and attributes' do
    expect(page).to have_content(@ring.name)
    expect(page).to have_content(@cloth_belt.name)
    expect(page).to have_content(@m_memory.name)
    expect(page).to have_content(@mu_memory.name)
    expect(page).to have_content(@feet.name)
    expect(page).to have_content("Updated at: #{@gloves.updated_at}")
    expect(page).to have_content("Boss ID: #{@feet.world_boss_id}")
    expect(page).to have_content("Created at: #{@m_memory.created_at}")
    expect(page).to have_content("ID: #{@cloth_belt.id}")
    expect(page).to have_content("World of Warcraft(Shadowlands) Loot Table")
  end

  it 'has a link to each Loot' do
    expect(page).to have_link(@ring.name)
    expect(page).to have_link(@cloth_belt.name)

    click_link @ring.name
    expect(current_path).to eq("/loots/#{@ring.id}")


    visit "/loots"

    click_link @cloth_belt.name
    expect(current_path).to eq("/loots/#{@cloth_belt.id}")

  end
end