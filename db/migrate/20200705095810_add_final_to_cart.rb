class AddFinalToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :final, :boolean, default: false
  end
end
