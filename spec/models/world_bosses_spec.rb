require 'rails_helper'

describe WorldBoss, type: :model do
  it {should have_many :loots}

  before(:each) do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
    @muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
    @oranomonos = WorldBoss.create!(name: "Oranomonos the Everbranching", max_health:12_000_000, is_current_boss: true, zone: "Ardenweald")

    @ring = @mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
    @cloth_belt = @mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
    @m_memory = @mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)
    @mu_memory = @muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
  end

  it 'shows bosses ordered by most recently created' do
    expected = [@oranomonos, @muckformed, @mortanis]

    expect(WorldBoss.ordered_bosses(nil)).to eq(expected)
  end

  it 'counts the amount of loot per boss' do
    expect(@mortanis.loot_count).to eq(3)
    expect(@muckformed.loot_count).to eq(1)
  end

  it 'filters armor by amount' do
    expect(@mortanis.min_armor(26)).to eq([@cloth_belt])
  end

  it 'can sort the loot by name' do
    expect(@mortanis.sort_loots(:sort)).to eq([@ring, @m_memory, @cloth_belt])
    expect(@mortanis.sort_loots).to eq([@ring, @cloth_belt, @m_memory])
  end

  it 'sorts bosses by the amount of loot they have' do
    expect(WorldBoss.ordered_bosses('loots')).to eq([@mortanis, @muckformed, @oranomonos])
  end
end
