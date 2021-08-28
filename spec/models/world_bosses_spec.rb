require 'rails_helper'

describe WorldBoss, type: :model do
  it {should have_many :loots}
end
