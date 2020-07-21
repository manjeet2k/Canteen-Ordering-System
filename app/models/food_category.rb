class FoodCategory < ApplicationRecord
  has_many :food_stores, dependent: :destroy 

  validates :name,  presence: true, length: { maximum: 80, minimum: 3 }, uniqueness: true
end
