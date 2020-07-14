class FoodCategory < ApplicationRecord
  has_many :food_stores 

  validates :name,  presence: true, length: { maximum: 80, minimum: 3 }, uniqueness: true
end
