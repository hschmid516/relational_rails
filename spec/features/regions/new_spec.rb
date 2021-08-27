# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe "Region Creation" do
  it "links to the new page from Region index" do
    visit "/regions"
    click_link "New Region"

    expect(current_path).to eq("/regions/new")
  end

  it "can create a new region" do
    visit "/regions/new"

    fill_in("Name", with: "Eldin")
    check("Has divine beast")
    fill_in("shrines", with: 7)
    click_button 'Create Region'

    expect(current_path).to eq("/regions")
    expect(page).to have_content("Eldin")
  end
end
