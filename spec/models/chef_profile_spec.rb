require 'rails_helper'

RSpec.describe ChefProfile, type: :model do
  subject(:chef_profile) { FactoryBot.build(:chef_profile) }
  describe ".chef_name_presence" do
    context "when name is present" do
      it "chef having an name is valid" do
        expect(chef_profile).to be_valid
      end
    end
    context "when name is not present" do
      it "chef having no name is invalid" do
        chef_profile.name = ""
        expect(chef_profile).not_to be_valid
      end
    end
  end
end
