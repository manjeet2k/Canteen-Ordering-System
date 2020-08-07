require 'rails_helper'

RSpec.describe FoodStore, type: :model do
  subject(:store) { FactoryBot.create(:food_store) }
  let(:chef) { FactoryBot.create(:chef_profile, food_store_id: store.id) }
  describe ".food_store_name_validation" do 
    context "when store name is present" do
      it "store having name is valid" do
        expect(store).to be_valid
      end
    end
    
    context "when store name is absent" do
      it "store having no name is invalid" do
        store.name = ""
        expect(store).not_to be_valid
      end
    end
  end

  describe "model validation test" do
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(40) }
  end

  describe "model association test" do 
    it { is_expected.to belong_to :food_category }
    it { is_expected.to have_many :chef_profiles }
    it { is_expected.to have_many :carts }
    it { is_expected.to have_many :food_items }
  end

  describe "instance method test" do
    it "is expected to return all chefs belonging to store" do 
      expect(store.chefs).to include(chef)
    end
  end
      
      

end
