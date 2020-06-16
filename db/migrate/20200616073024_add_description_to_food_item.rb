class AddDescriptionToFoodItem < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :description, :string
  end
end
