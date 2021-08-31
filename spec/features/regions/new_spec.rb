require 'rails_helper'

RSpec.describe 'Region Creation' do
  it 'links to the new page from Region index' do
    visit '/regions'
    click_button 'New Region'

    expect(current_path).to eq('/regions/new')
  end

  it 'can create a new region' do
    visit '/regions/new'

    fill_in('Name', with: 'Eldin')
    check('Has divine beast')
    fill_in('shrines', with: 7)
    click_button 'Create Region'

    expect(current_path).to eq('/regions')
    expect(page).to have_content('Eldin')
  end
end
