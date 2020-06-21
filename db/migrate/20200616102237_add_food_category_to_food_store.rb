class AddFoodCategoryToFoodStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :food_stores, :food_category, null: false, foreign_key: true
  end
end
