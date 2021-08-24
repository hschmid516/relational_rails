require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it 'has links to other pages' do
    visit "/"

    expect(current_path).to eq("/")
    expect(page).to have_link("World Bosses")
    expect(page).to have_link("Regions")
  end
end
