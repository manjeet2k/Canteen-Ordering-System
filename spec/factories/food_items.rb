FactoryBot.define do
  factory :food_item, class: FoodItem do
    name { Faker::Food.dish }
    price { 56.45 }
    description { "some description" }
    food_store_id { 1 }
    food_store { create(:food_store) }
  end
end
