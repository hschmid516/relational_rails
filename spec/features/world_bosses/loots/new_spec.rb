require 'rails_helper'


RSpec.describe 'it creates boss loot' do
  it 'links to the new page to create loot for specific boss' do
    boss = WorldBoss.create!(name: "Boss", max_health: 10, is_current_boss: false, zone: "The World")

    visit "/world_bosses/#{boss.id}/loots"

    click_button('New Loot')
    expect(current_path).to eq("/world_bosses/#{boss.id}/loots/new")
  end

  it 'can create new loot' do
    boss = WorldBoss.create!(name: "Boss", max_health: 10, is_current_boss: false, zone: "The World")

    visit "/world_bosses/#{boss.id}/loots/new"

    fill_in('Name', with: 'Neck Piece')
    fill_in('armor', with: 100)
    check('memory')
    click_button('Create Loot')

    expect(current_path).to eq("/world_bosses/#{boss.id}/loots")
    expect(page).to have_content("Neck Piece")
  end
end
