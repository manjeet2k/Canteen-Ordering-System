class AddImagesToChefProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :images, :json
  end
end
