class FoodStore < ApplicationRecord
  has_many :chefs,      dependent: :destroy
  has_many :food_items, dependent: :destroy
end
