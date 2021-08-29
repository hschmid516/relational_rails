require 'rails_helper'

RSpec.describe "Loots has an index page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: true, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)

    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
    @feet = @muckformed.loots.create!(name: "Jingling Stone Stompers", memory: true, armor: 82)
    @gloves = @muckformed.loots.create!(name: "Hardened Castle Crusher", memory: true, armor: 21)
    visit "/loots"

  end

  it 'can see all loots recorded in the system where boolean is true and attributes' do
    expect(page).to_not have_content(@ring.name) # because it only shows true booleans
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

  it 'has a link to each Loot with true booleans' do
    expect(page).to_not have_link(@ring.name) #because boolean was not true
    expect(page).to have_link(@cloth_belt.name)

    click_link @cloth_belt.name
    expect(current_path).to eq("/loots/#{@cloth_belt.id}")


    visit "/loots"

    click_link @cloth_belt.name
    expect(current_path).to eq("/loots/#{@cloth_belt.id}")

  end
  it 'has a link for all bosses and all loot' do

    expect(page).to have_link("All World Bosses")
    click_link("All World Bosses")
    expect(current_path).to eq("/world_bosses")

    expect(page).to have_link("All Loot")
    click_link("All Loot")
    expect(current_path).to eq("/loots")

  end

  it 'shows only true records' do

    visit '/loots'
    expect(page).to_not have_content(@ring)
  end

  it 'shows a link to edit the loot info' do
    click_button("Edit Memory of a Frenzied Monstrosity")
    expect(current_path).to eq("/loots/#{@mu_memory.id}/edit")
  end
end
