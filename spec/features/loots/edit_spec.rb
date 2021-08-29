# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'the loot edit' do
  it 'links to an edit page' do
    mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    ring = mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)

    visit "/loots/#{ring.id}"
    click_button "Update #{ring.name}"

    expect(current_path).to eq("/loots/#{ring.id}/edit")
  end

  it 'can edit the loot' do
    mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    ring = mortanis.loots.create!(name: "sdfasdf", memory: false, armor: 0)

    visit "/loots/#{ring.id}"

    expect(page).to have_content('sdfasdf')
    click_button 'Update sdfasdf'

    fill_in 'Name', with: "Band of the Risen Bonelord"
    click_button 'Update Loot'

    expect(current_path).to eq("/loots/#{ring.id}")
    expect(page).to have_content("Band")
    expect(page).to_not have_content("sdfasdf")
  end
end
