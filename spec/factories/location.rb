FactoryBot.define do
  factory :location, class: Location do
    name { Faker::Games::Zelda.location }
    is_cold  { true }
    korok_seeds { Faker::Number.within(range: 1..50) }
    association :region
  end
end
