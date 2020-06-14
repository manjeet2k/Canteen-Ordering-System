class CreateFoodStores < ActiveRecord::Migration[6.0]
  def change
    create_table :food_stores do |t|
      t.string :name

      t.timestamps
    end
  end
end
