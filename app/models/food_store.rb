class FoodStore < ApplicationRecord
  belongs_to :food_category
  has_many   :chefs,      dependent: :destroy
  has_many   :food_items, dependent: :destroy  
end
