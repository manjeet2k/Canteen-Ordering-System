class ChangeUserSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :created_at
    remove_column :users, :updated_at
    add_column :users, :created_at, :datetime, precision: 6, null: false
    add_column :users, :updated_at, :datetime, precision: 6, null: false
  end
end
