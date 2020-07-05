class FoodItem < ApplicationRecord
  belongs_to :food_store
  has_and_belongs_to_many :cart_items
end
