class CreateChefProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :chef_profiles do |t|
      t.string :name, null:false
      t.string :phone, null: false
      t.references :user, null: false, foreign_key: true
      t.references :food_store, null: false, foreign_key: true
      t.boolean :approved, default: false
      t.boolean :rejected, default: false

      t.timestamps
    end
  end
end
