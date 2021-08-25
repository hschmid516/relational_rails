require 'rails_helper'

RSpec.describe "Regions show page", type: :feature do
  before :each do
    @great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
    @akkala = Region.create!(name: "Akkala", has_divine_beast: true, shrines: 8)
  end

  it 'displays the region name' do
    visit "/regions/#{@great_plateau.id}"

    expect(page).to have_content(@great_plateau.name)
    expect(page).to have_content(@great_plateau.has_divine_beast)
    expect(page).to have_content(@great_plateau.shrines)
    expect(page).to_not have_content(@akkala.name)
    expect(page).to_not have_content(@akkala.has_divine_beast)
    expect(page).to_not have_content(@akkala.shrines)
  end
end
