class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food_item
  validates_uniqueness_of :food_item_id, scope: :cart_id

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 6 }

  def sub_total
    quantity*food_item.price
  end
  
end
