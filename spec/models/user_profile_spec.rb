require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject(:user_profile) { FactoryBot.build(:user_profile )}

  describe ".user_name_presence" do
    context "when user name present" do
      it "user having a name is valid" do
        expect(user_profile).to be_valid
      end
    end
    context "when user name not present" do
      it "user having no name is invalid" do
        user_profile.name = ""
        expect(user_profile).not_to be_valid
      end
    end
  end

  describe ".user_name_length" do
    context "with valid user name length" do
      it "user having name of length within 2 and 30 characters is valid" do
        expect(user_profile).to be_valid
      end
    end
    context "with invalid user name length" do
      it "user not having name of length within 2 and 30 characters is invalid" do
        user_profile.name = "S"
        expect(user_profile).not_to be_valid
      end 
    end
  end

end
