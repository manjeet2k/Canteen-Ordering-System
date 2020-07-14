class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food_item

  def sub_total
    quantity*food_item.price
  end
  
end
