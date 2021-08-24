require 'rails_helper'

describe WorldBoss, type: :model do
  before(:each) do
    @mortanis = WorldBoss.create!(name: "Mortanis", max_health:100_000_000, is_current_boss: false, zone: "Maldraxxus")
  end

  it 'exists and has attributes' do
    expect(@mortanis).to be_a(WorldBoss)
    expect(@mortanis.name).to eq("Mortanis")
    expect(@mortanis.max_health).to eq(100_000_000)
    expect(@mortanis.is_current_boss).to eq(false)
    expect(@mortanis.zone).to eq("Maldraxxus")
  end
end
