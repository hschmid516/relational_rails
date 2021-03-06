FactoryBot.define do
  factory :region, class: Region do
    name { Faker::Games::Zelda.character }
    has_divine_beast  { true }
    shrines { Faker::Number.within(range: 1..50) }
  end
end
