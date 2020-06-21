class CreateFoodCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :food_categories do |t|
      t.string :name
      t.references :food_store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
