class Cart < ApplicationRecord
  belongs_to :user
  has_many   :cart_items
  has_many   :food_items, through: :cart_items
end
