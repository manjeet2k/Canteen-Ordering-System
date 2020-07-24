class AddFoodStoreToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :food_store, foreign_key: true
  end
end
