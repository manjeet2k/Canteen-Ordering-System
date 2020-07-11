class AddOrderStatusToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :order_status, :integer
  end
end
