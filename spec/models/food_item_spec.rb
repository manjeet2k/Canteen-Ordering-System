require 'rails_helper'

RSpec.describe FoodItem, type: :model do
  subject(:food_item) { FactoryBot.build(:food_item) }
  describe ".item_name_presence" do
    context "when item name present" do
      it "item having a name is valid" do
        expect(food_item).to be_valid
      end
    end
    context "when item name not present" do
      it "item having no name is invalid" do
        food_item.name = ""
        expect(food_item).not_to be_valid
      end
    end
  end

  describe ".item_name_length" do
    context "with valid item name length" do
      it "item having name of length within 3 and 30 characters is valid" do
        expect(food_item).to be_valid
      end
    end
    context "with invalid item name length" do
      it "item not having name of length within 3 and 30 characters is invalid" do
        food_item.name = "S"
        expect(food_item).not_to be_valid
      end 
    end
  end

  describe ".item_description_validations" do
    context "when description is present" do
      it "item having description is valid" do
        expect(food_item).to be_valid
      end

      it "item having description with valid length is valid" do
        expect(food_item).to be_valid
      end

      it "item having description with invalid length is invalid" do
        food_item.description = "as"
        expect(food_item).not_to be_valid
      end
    end

    context "when description is absent" do
      it "item without description is invalid" do
        food_item.description = ""
        expect(food_item).not_to be_valid
      end 
    end
  end

  describe ".item_price_validations" do
    context "when price is present" do
      it "item having price is valid" do
        expect(food_item).to be_valid
      end

      it "item with price less than 0 is invalid" do
        food_item.price = -5
        expect(food_item).not_to be_valid
      end
      
      it "item with price greater than 20000 is invalid" do
       food_item.price = 20001
       expect(food_item).not_to be_valid
      end
    end

    context "when price is absent" do
      it "item without price is invalid" do
        food_item.price = nil
        expect(food_item).not_to be_valid
      end 
    end
  end

  describe "belongs_to :food_store" do
    it { is_expected.to belong_to :food_store }  
  end

  describe "has_many :cart_items" do
    it { is_expected.to have_many :cart_items }
  end
end
