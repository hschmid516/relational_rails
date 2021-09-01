require 'rails_helper'

RSpec.describe 'create region location' do
  before :each do
    @region = create(:region)
  end
  it 'links to the new page from Region index' do

    visit "/regions/#{@region.id}/locations"
    click_button 'New Location'

    expect(current_path).to eq("/regions/#{@region.id}/locations/new")
  end

  it 'can create a new location' do
    visit "/regions/#{@region.id}/locations/new"

    fill_in('Name', with: 'Death Mountain')
    check('Is cold')
    fill_in('Korok seeds', with: 32)
    click_button 'Create Location'

    expect(current_path).to eq("/regions/#{@region.id}/locations")
    expect(page).to have_content('Death Mountain')
  end
end
