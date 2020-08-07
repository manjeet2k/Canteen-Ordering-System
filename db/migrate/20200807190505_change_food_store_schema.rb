class ChangeFoodStoreSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :food_stores, :created_at
    remove_column :food_stores, :updated_at
    add_column :food_stores, :created_at, :datetime, precision: 6, null: false
    add_column :food_stores, :updated_at, :datetime, precision: 6, null: false
  end
end
