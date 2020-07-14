class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
