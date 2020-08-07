FactoryBot.define do
  factory :cart_item, class: CartItem do
    cart_id { 1 }
    quantity { 1 }
    food_item_id { 1 }
    cart { create(:cart) }
    food_item { create(:food_item) }    
  end

  factory :cart_item_2, class: CartItem do
    cart_id { 1 }
    quantity { 1 }
    food_item_id { 1 }
    cart { create(:cart) }
    food_item { create(:food_item) }    
  end
end
