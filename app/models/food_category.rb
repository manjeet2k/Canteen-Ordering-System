class FoodCategory < ApplicationRecord
  has_many :food_stores, dependent: :destroy 

  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i

  validates :name,  presence: true, format: { with: VALID_NAME_REGEX }, length: { maximum: 40, minimum: 2 }, uniqueness: true
end
