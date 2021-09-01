require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  before :each do
    @region1 = create(:region)
    @region2 = create(:region)
    @location1 = create(:location, is_cold: :true, region: @region1)
    @location2 = create(:location, is_cold: :true, region: @region1)
    @location3 = create(:location, region: @region2)
    visit "/locations/#{@location1.id}"
  end

  it 'can see all locations recorded in the system' do
    expect(page).to have_content(@location1.name)
    expect(page).to have_content("Is Cold: #{@location1.is_cold}")
    expect(page).to have_content("Number of Korok Seeds: #{@location1.korok_seeds}")
    expect(page).to have_content("Region Name: #{@location1.region.name}")
    expect(page).to have_content("Created At: #{@location1.created_at}")
    expect(page).to have_content("Updated At: #{@location1.updated_at}")
    expect(page).to have_content(@location1.id)
    expect(page).to_not have_content(@location2.name)
    expect(page).to_not have_content(@location3.name)
  end

  it 'has links to all regions and locations' do
    expect(page).to have_link('All Regions')
    expect(page).to have_link('All Locations')

    click_link('All Regions')

    expect(current_path).to eq('/regions')

    visit "/locations/#{@location1.id}"

    click_link('All Locations')

    expect(current_path).to eq('/locations')
  end

  it 'can edit locations from show' do
    click_button("Edit")

    expect(current_path).to eq("/locations/#{@location1.id}/edit")
  end

  it 'can delete locations from show page' do
    click_button("Delete")

    expect(current_path).to eq('/locations')
    expect(page).to_not have_content(@location1.name)
  end
end
