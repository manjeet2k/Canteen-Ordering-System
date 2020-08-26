class AddFavouriteToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :favourite, :boolean, default: false
  end
end
