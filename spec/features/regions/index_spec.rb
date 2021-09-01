require 'rails_helper'

RSpec.describe 'regions index page', type: :feature do
  before :each do
    @region1 = create(:region)
    @region2 = create(:region, name: :Akkala)
    @location1 = create(:location, region: @region1)
    @location2 = create(:location, region: @region2)
    @location3 = create(:location, region: @region2)
    visit '/regions'
  end

  it 'can see all regions recorded in the system' do
    expect(current_path).to eq('/regions')
    expect(page).to have_content(@region1.name)
    expect(page).to have_content(@region2.name)
    expect(page).to have_content('Legend of Zelda: Breath of the Wild - Regions')
  end

  it 'has a link to each region' do
    expect(page).to have_link(@region1.name)
    expect(page).to have_link(@region2.name)

    click_link @region1.name

    expect(current_path).to eq("/regions/#{@region1.id}")

    visit '/regions'

    click_link @region2.name

    expect(current_path).to eq("/regions/#{@region2.id}")
  end

  it 'shows regions ordered by most recently created' do
    expect(@region2.name).to appear_before(@region1.name)
  end

  it 'shows created at next to each name' do
    expect(page).to have_content(@region1.created_at)
    expect(page).to have_content(@region2.created_at)
  end

  it 'has links to all regions and locations' do
    click_link('All Locations')

    expect(current_path).to eq('/locations')
  end

  it 'can update regions from index page' do
    within "#region-#{@region1.id}" do
      click_button("Edit")

      expect(current_path).to eq("/regions/#{@region1.id}/edit")
    end
  end

  it 'can delete regions from index page' do
    within "#region-#{@region1.id}" do
      click_button("Delete")

      expect(current_path).to eq('/regions')
    end

      expect(page).to_not have_content(@region1.name)
  end

  it 'sorts regions by number of locations' do
    click_button('Sort by Number of Locations')

    expect(current_path).to eq('/regions')
    expect(@region2.name).to appear_before(@region1.name)
    expect(page).to have_content("Number of Locations: #{@region1.location_count}")
    expect(page).to have_content("Number of Locations: #{@region2.location_count}")
  end

  it 'searches for regions by exact name' do
    fill_in('search', with: @region2.name)
    click_button('Search by Exact Name')

    expect(page).to have_content(@region2.name)
    expect(page).to_not have_content(@region1.name)
  end

  it 'searches for regions by partial name' do
    fill_in('search_partial', with: 'akk')
    click_button('Search by Partial Name')

    expect(page).to have_content(@region2.name)
    expect(page).to_not have_content(@region1.name)
  end
end
