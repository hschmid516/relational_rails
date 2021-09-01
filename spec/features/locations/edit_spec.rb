require 'rails_helper'

RSpec.describe 'Location Updates' do
  it 'links to an edit page' do
    eldin = Region.create!(name: 'Eldin', has_divine_beast: true, shrines: 9)
    death = eldin.locations.create!(name: 'Death Mountain', is_cold: false, korok_seeds: 32)

    visit "/locations/#{death.id}"

    click_button "Edit"

    expect(current_path).to eq("/locations/#{death.id}/edit")
  end

  it 'can edit the location' do
    eldin = Region.create!(name: 'Eldine', has_divine_beast: true, shrines: 9)
    death = eldin.locations.create!(name: 'Darth Mountain', is_cold: false, korok_seeds: 32)

    visit "/locations/#{death.id}"

    expect(page).to have_content('Darth Mountain')

    click_button 'Edit'
    fill_in 'Name', with: 'Death Mountain'
    click_button 'Update'

    expect(current_path).to eq("/locations/#{death.id}")
    expect(page).to have_content('Death Mountain')
  end
end
