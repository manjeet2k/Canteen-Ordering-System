FactoryBot.define do
  factory :cart, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    user { create(:user) }
    food_store { create(:food_store)}
  end
end
