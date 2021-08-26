require 'rails_helper'

RSpec.describe "Loots show page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
  end

  it 'displays the loot name' do
    visit "/loots/#{@ring.id}"

    expect(current_path).to eq("/loots/#{@ring.id}")
    expect(page).to have_content(@ring.name)
    expect(page).to have_content("Armor: #{@ring.armor}")
    expect(page).to have_content("Boss ID: #{@ring.world_boss_id}")
    expect(page).to_not have_content(@mu_memory.name)
    expect(page).to_not have_content(@mu_memory.world_boss_id)
  end

  it 'has a link for all bosses and all loot' do
    visit "/loots/#{@ring.id}"

    expect(page).to have_link("All World Bosses")
    click_link("All World Bosses")
    expect(current_path).to eq("/world_bosses")

    expect(page).to have_link("All Loot")
    click_link("All Loot")
    expect(current_path).to eq("/loots")

  end
end
