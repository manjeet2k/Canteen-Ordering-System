FactoryBot.define do
  factory :food_store do
    name { "Some Store" }
    food_category_id { 1 }
    food_category { create(:food_category) }
  end
end
