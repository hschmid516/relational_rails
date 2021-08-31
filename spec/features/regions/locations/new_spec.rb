require 'rails_helper'

RSpec.describe 'create region location' do
  it 'links to the new page from Region index' do
    eldin = Region.create!(name: 'Eldin', has_divine_beast: true, shrines: 9)

    visit "/regions/#{eldin.id}/locations"
    click_button 'New Location'

    expect(current_path).to eq("/regions/#{eldin.id}/locations/new")
  end

  it 'can create a new location' do
    eldin = Region.create!(name: 'Eldin', has_divine_beast: true, shrines: 9)
    visit "/regions/#{eldin.id}/locations/new"

    fill_in('Name', with: 'Death Mountain')
    check('Is cold')
    fill_in('Korok seeds', with: 32)
    click_button 'Create Location'

    expect(current_path).to eq("/regions/#{eldin.id}/locations")
    expect(page).to have_content('Death Mountain')
  end
end
