class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, after: :email
    add_column :users, :uid, :string, after: ":email"
  end
end
