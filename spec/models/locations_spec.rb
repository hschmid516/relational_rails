require 'rails_helper'

describe Location, type: :model do
  it {should belong_to :region}
end
