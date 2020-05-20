FactoryBot.define do
  factory :customer do
    first_name { Faker::Science.element }
    last_name { Faker::Games::Myst.character }
  end
end
