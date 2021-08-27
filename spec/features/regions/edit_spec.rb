# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe "Region Updates" do
  it "links to an edit page" do
    eldin = Region.create!(name: "Eldin", has_divine_beast: true, shrines: 9)

    visit "/regions/#{eldin.id}"

    click_button "Edit #{eldin.name}"

    expect(current_path).to eq("/regions/#{eldin.id}/edit")
  end

  it 'can edit the region' do
    eldin = Region.create!(name: "Eldine", has_divine_beast: true, shrines: 9)

    visit "/regions"

    expect(page).to have_content('Eldine')

    visit "/regions/#{eldin.id}"

    click_button 'Edit Eldine'

    fill_in 'Name', with: 'Eldin'
    click_button 'Update Region'

    expect(current_path).to eq("/regions/#{eldin.id}")
    expect(page).to have_content("Eldin")
  end
end
