require 'rails_helper'

RSpec.describe 'Region Updates' do
  it 'links to an edit page' do
    eldin = Region.create!(name: 'Eldin', has_divine_beast: true, shrines: 9)

    visit "/regions/#{eldin.id}"

    click_button "Edit"

    expect(current_path).to eq("/regions/#{eldin.id}/edit")
  end

  it 'can edit the region' do
    eldin = Region.create!(name: 'Eldine', has_divine_beast: true, shrines: 9)

    visit '/regions'

    expect(page).to have_content('Eldine')

    visit "/regions/#{eldin.id}"

    click_button "Edit"

    fill_in 'Name', with: 'Eldin'
    click_button 'Update Region'

    expect(current_path).to eq("/regions/#{eldin.id}")
    expect(page).to have_content("#{eldin.name}")
  end
end
