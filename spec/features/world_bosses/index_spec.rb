require 'rails_helper'

RSpec.describe "Bosses index page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
    @oranomonos = WorldBoss.create!(name: "Oranomonos the Everbranching", max_health:12_000_000, is_current_boss: true, zone: "Ardenweald")
    visit "/world_bosses"
  end

  it 'can see all world bosses recorded in the system' do

    expect(current_path).to eq("/world_bosses")
    expect(page).to have_content(@mortanis.name)
    expect(page).to have_content(@muckformed.name)
    expect(page).to have_content("World of Warcraft Shadowlands World Bosses")
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

  it 'shows world bosses ordered by most recently created' do

    expect(@oranomonos.name).to appear_before(@muckformed.name)
    expect(@muckformed.name).to appear_before(@mortanis.name)

  end

  it 'shows created at stamp next to each boss' do
    expect(page).to have_content("Created at: #{@oranomonos.created_at}")
    expect(page).to have_content("Created at: #{@muckformed.created_at}")
    expect(page).to have_content("Created at: #{@mortanis.created_at}")
  end

  it 'has a link for all pages' do
    expect(page).to have_link("All Loot")

    click_link("All Loot")
    expect(current_path).to eq("/loots")

    click_link("Home")
    expect(current_path).to eq("/")

  end

  it 'shows a link to edit the Boss info' do
    click_button("Edit #{@mortanis.name}")
    expect(current_path).to eq("/world_bosses/#{@mortanis.id}/edit")
  end

  it 'deletes the boss from the index page' do
    click_button("Delete #{@mortanis.name}")
    expect(current_path).to eq("/world_bosses")
    expect(page).to_not have_content("#{@mortanis.name}")
  end
end
