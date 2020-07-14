class RenameProfileTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :employees, :employee_profiles
    rename_table :chefs, :chef_profiles
  end
end
