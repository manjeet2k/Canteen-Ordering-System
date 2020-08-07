require 'rails_helper'

RSpec.describe ChefProfile, type: :model do
  subject(:chef_profile) { FactoryBot.build(:chef_profile) }

  describe ".chef_name_presence" do
    context "when chef name present" do
      it "chef having a name is valid" do
        expect(chef_profile).to be_valid
      end
    end
    context "when chef name not present" do
      it "chef having no name is invalid" do
        chef_profile.name = ""
        expect(chef_profile).not_to be_valid
      end
    end
  end

  describe ".chef_name_length" do
    context "with valid chef name length" do
      it "chef having name of length within 2 and 30 characters is valid" do
        expect(chef_profile).to be_valid
      end
    end
    context "with invalid chef name length" do
      it "chef not having name of length within 2 and 30 characters is invalid" do
        chef_profile.name = "S"
        expect(chef_profile).not_to be_valid
      end 
    end
  end

  describe ".chef_phone_length" do
    context "with valid phone number format" do
      it "chef having phone number of length 10 characters is valid" do
        expect(chef_profile).to be_valid
      end
    end
    context "with invalid phone number format" do
      it "chef not having phone number of valid format is invalid" do
        chef_profile.phone = "906532s"
        expect(chef_profile).not_to be_valid
      end 
    end
  end

  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }  
  end

  describe "belongs_to :food_store" do
    it { is_expected.to belong_to :food_store }  
  end
end
