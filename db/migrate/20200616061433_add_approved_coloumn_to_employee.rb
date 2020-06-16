class AddApprovedColoumnToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :approved, :boolean, default: false
  end
end
