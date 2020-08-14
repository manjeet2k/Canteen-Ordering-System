FactoryBot.define do
  factory :cart, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    user { create(:user) }
    food_store { create(:food_store)}
  end

  factory :placed_order, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    order_status { 0 }
    user { create(:user) }
    food_store { create(:food_store)}
  end

  factory :recieved_order, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    order_status { 1 }
    user { create(:user) }
    food_store { create(:food_store)}
  end

  factory :cooking_order, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    order_status { 2 }
    user { create(:user) }
    food_store { create(:food_store)}
  end

  factory :delivered_order, class: Cart do
    user_id { 1 }  
    food_store_id { 1 }
    order_status { 3 }
    user { create(:user) }
    food_store { create(:food_store)}
  end
end
