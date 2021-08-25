require 'rails_helper'

RSpec.describe "Bosses show page", type: :feature do
  before :each do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
  end

  it 'displays the boss name' do
    visit "/world_bosses/#{@mortanis.id}"

    expect(page).to have_content(@mortanis.name)
    expect(page).to have_content(@mortanis.max_health)
    expect(page).to have_content(@mortanis.is_current_boss)
    expect(page).to have_content(@mortanis.zone)
    expect(page).to_not have_content(@muckformed.zone)
    expect(page).to_not have_content(@muckformed.name)
  end
end
