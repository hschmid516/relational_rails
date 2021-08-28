require 'rails_helper'

describe Loot, type: :model do
  it {should belong_to :world_boss}

  it 'shows only true records' do
    ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)
    mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)

    expect(page).to have_content("Memory of Fujieda")
    expect(page).to have_content("Memory of a Frenzied Monstrosity")
    expect(page).to_not have_content("Spine Crawler Waistcord")
    expect(page).to_not have_content("Band of the Risen Bonelord")
  end
end
