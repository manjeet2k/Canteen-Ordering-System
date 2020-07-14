class FoodItem < ApplicationRecord
  belongs_to :food_store
  has_and_belongs_to_many :cart_items

  validates :name,  presence: true, length: { maximum: 40, minimum: 3 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 20000 }
  validates :description, presence: true, length: { maximum: 80, minimum: 3 }
end
