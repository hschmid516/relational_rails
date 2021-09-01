require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  before :each do
    @region1 = create(:region)
    @region2 = create(:region)
    @location1 = create(:location, is_cold: :true, region_id: @region1.id)
    @location2 = create(:location, region_id: @region2.id)
    @location3 = create(:location, is_cold: :false, region_id: @region2.id)
    visit '/locations'
  end

  it 'can see all locations recorded in the system' do
    expect(page).to have_content(@location1.name)
    expect(page).to have_content(@location2.name)
    expect(page).to have_content("Is Cold: #{@location1.is_cold}")
    expect(page).to have_content("Is Cold: #{@location2.is_cold}")
    expect(page).to have_content("Number of Korok Seeds: #{@location1.korok_seeds}")
    expect(page).to have_content("Number of Korok Seeds: #{@location2.korok_seeds}")
    expect(page).to have_content("Region ID: #{@location2.region_id}")
    expect(page).to have_content("Created At: #{@location2.created_at}")
    expect(page).to have_content("Updated At: #{@location2.updated_at}")
    expect(page).to have_content("Region ID: #{@location1.region_id}")
    expect(page).to have_content("Created At: #{@location1.created_at}")
    expect(page).to have_content("Updated At: #{@location1.updated_at}")
    expect(page).to have_content("ID: #{@location2.id}")
    expect(page).to have_content("ID: #{@location1.id}")
    expect(page).to have_content('Legend of Zelda: Breath of the Wild - Locations')
  end

  it 'has a link to each location' do
    expect(page).to have_link(@location1.name)
    expect(page).to have_link(@location2.name)

    click_link @location1.name

    expect(current_path).to eq("/locations/#{@location1.id}")

    visit '/locations'

    click_link @location2.name

    expect(current_path).to eq("/locations/#{@location2.id}")
  end

  it 'has links to all regions and locations' do
    expect(page).to have_link('All Regions')

    click_link('All Regions')

    expect(current_path).to eq('/regions')
  end

  it 'only shows locations that are cold' do
    expect(page).to_not have_content('Is Cold: false')
    expect(page).to_not have_content(@location3.name)
    expect(page).to have_content('Is Cold: true')
  end

  it 'can update locations from index page' do
    within "#location-#{@location1.id}" do
      click_button("Edit")

      expect(current_path).to eq("/locations/#{@location1.id}/edit")
    end
  end

  it 'can delete locations from index page' do
    within "#location-#{@location1.id}" do
      click_button("Delete")

      expect(current_path).to eq('/locations')
    end

    expect(page).to_not have_content(@location1.name)
  end

  it 'searches for locations by exact name' do
    fill_in('search', with: @location1.name)
    click_button('Search by Exact Name')

    expect(page).to have_content(@location1.name)
    expect(page).to_not have_content(@location2.name)
  end

  it 'searches for locations by partial name' do
    fill_in('search_partial', with: @location1.name[0..3])
    click_button('Search by Partial Name')

    expect(page).to have_content(@location1.name)
    expect(page).to_not have_content(@location2.name)
  end
end
