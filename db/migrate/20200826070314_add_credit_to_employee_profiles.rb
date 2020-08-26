class AddCreditToEmployeeProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :employee_profiles, :credit, :decimal, default: 0
  end
end
