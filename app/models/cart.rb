class Cart < ApplicationRecord
  belongs_to :user
  has_many   :cart_items, dependent: :destroy
  has_many   :food_items, through: :cart_items


  enum order_status: [:Placed, :Recieved, :Cooking, :Delivered]

  def total
    cart_items.collect {|item| item.valid? ? item.sub_total : 0}.sum
  end

  def store
    food_items.first.food_store
  end
end
