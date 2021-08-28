require 'rails_helper'

RSpec.describe 'the Boss creation' do
  it 'links to the new page to create a world boss' do
    visit '/world_bosses'

    click_button('New Boss')
    expect(current_path).to eq('/world_bosses/new')
  end

  it 'can create a new boss with attributes' do
    visit '/world_bosses/new'

    fill_in('Name', with: 'Valinor')
    fill_in('max_health', with: '18000')
    check('is_current_boss')
    fill_in('Zone', with: 'Bastion')
    click_button('Create Boss')

    expect(current_path).to eq("/world_bosses")
    expect(page).to have_content('Valinor')
    expect(page).to have_content('18000')
    expect(page).to have_content('Bastion')
    expect(page).to have_content('Is current boss?')
  end
end
