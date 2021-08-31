require 'rails_helper'

describe Loot, type: :model do
  it {should belong_to :world_boss}
  before(:each) do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)
    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
  end
  it 'shows only true records' do

    expect(Loot.show_true).to eq([@m_memory, @mu_memory])
  end

  it 'searches for boss by exact name' do
    expect(Loot.exact_search(@ring.name)).to eq([@ring])
  end

  it 'searches for boss by partial name' do
    expect(Loot.partial_search(@ring.name)).to eq([@ring])
  end
end
