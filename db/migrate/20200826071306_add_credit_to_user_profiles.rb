class AddCreditToUserProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :credit, :decimal, default: 0
  end
end
