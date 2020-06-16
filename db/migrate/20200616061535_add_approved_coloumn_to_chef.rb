class AddApprovedColoumnToChef < ActiveRecord::Migration[6.0]
  def change
    add_column :chefs, :approved, :boolean, default: false
  end
end
