class RemoveFoodStoreFromFoodCategory < ActiveRecord::Migration[6.0]
  def change
    remove_reference :food_categories, :food_store, null: false, foreign_key: true
  end
end
