class AddUserToChef < ActiveRecord::Migration[6.0]
  def change
    add_reference :chefs, :user, null: false, foreign_key: true
  end
end
