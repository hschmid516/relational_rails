# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'The boss edit' do
  it 'links to an edit page' do

    boss = WorldBoss.create!(name: "Guy", max_health: 10, is_current_boss: false, zone: "The World")

    visit "/world_bosses/#{boss.id}"
    click_button "Edit #{boss.name}"

    expect(current_path).to eq("/world_bosses/#{boss.id}/edit")
  end

  it 'can edit the boss' do

    boss = WorldBoss.create!(name: "adf", max_health: 10, is_current_boss: false, zone: "The World")

    visit "/world_bosses"

    expect(page).to have_content('adf')

    visit "/world_bosses/#{boss.id}"
    click_button 'Edit adf'

    fill_in 'Name', with: 'Guy'
    click_button 'Update Boss'

    expect(current_path).to eq("/world_bosses/#{boss.id}")
    expect(page).to have_content('Guy')
    expect(page).to_not have_content('adf')
  end
end
