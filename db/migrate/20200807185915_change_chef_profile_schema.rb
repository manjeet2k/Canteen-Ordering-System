class ChangeChefProfileSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :chef_profiles, :created_at
    remove_column :chef_profiles, :updated_at
    add_column :chef_profiles, :created_at, :datetime, precision: 6, null: false
    add_column :chef_profiles, :updated_at, :datetime, precision: 6, null: false
  end
end
