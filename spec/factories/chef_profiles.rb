FactoryBot.define do
  factory :chef_profile, class: ChefProfile do
    name { "User Name" }
    phone { "9865215432" }
    user_id { 1 }
    food_store_id { 1 }
    user { create(:user) }
    food_store { create(:food_store) }
  end
end