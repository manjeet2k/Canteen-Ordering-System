class FoodStore < ApplicationRecord
  has_many :chefs, dependent: :destroy
end
