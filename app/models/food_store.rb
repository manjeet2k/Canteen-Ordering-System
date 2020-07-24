class FoodStore < ApplicationRecord 
  belongs_to :food_category
  has_many   :food_items,    dependent: :destroy
  has_many   :chef_profiles, dependent: :destroy  
  has_many   :carts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 80, minimum: 2 }, uniqueness: true 

  def chefs
    ChefProfile.where(food_store_id: self.id)
  end

end
