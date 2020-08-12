FactoryBot.define do
  factory :food_category do
    name { Faker::Science.element }
  end
end
