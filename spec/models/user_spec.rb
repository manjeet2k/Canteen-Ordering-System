require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe ".user_email_presence" do
    context "when email is present" do
      it "user having an email is valid" do
        expect(user).to be_valid
      end
    end
    context "when email is not present" do
      it "user having no email is invalid" do
        user.email = ""
        expect(user).not_to be_valid
      end
    end
  end

  describe ".user_email_length" do
    context "with valid email length" do
      it "user having email of length within 9 and 80 characters is valid" do
        expect(user).to be_valid
      end
    end
    context "with invalid email length" do
      it "user not having email of length within 9 and 80 characters is invalid" do
        user.email = "g.in"
        expect(user).not_to be_valid
      end
    end
  end
  
  describe ".user_email_uniqueness" do
    let(:duplicate_user) { FactoryBot.create(:duplicate_user) }
    context "with unique email" do
      it "user having unique email is valid" do
        expect(duplicate_user).to be_valid
      end
    end
    
    context "with non-unique email" do
      it "user not having unique email is invalid" do
        user.email = duplicate_user.email
        expect(user).not_to be_valid
      end
    end
  end

  describe ".user_email_format" do
    context "with valid email format" do
      it "user containing email format _@_._is valid" do
        expect(user).to be_valid
      end
    end
    context "with invalid email format" do
      it "user not containing email format _@_._ is invalid" do
        user.email = "someone.com"
        expect(user).not_to be_valid
      end
    end
  end

  describe ".user_password_presence" do
    context "when password is present" do
      it "user having a password is valid" do
        expect(user).to be_valid
      end
    end
    context "when password is not present" do
      it "user having no password is invalid" do
        user.password = nil
        expect(user).not_to be_valid
      end
    end
  end

  describe "#user_password_length" do
    context "with valid password length" do
      it "user having password of length within 6 and 30 characters is valid" do
        expect(user).to be_valid
      end
    end
    context "with user password length" do
      it "user not having password of length within 6 and 30 characters is invalid" do
        user.password = "1111"
        expect(user).not_to be_valid
      end
    end
  end

  describe ".admin_scope_method" do
    let(:admin) { FactoryBot.create(:admin) }
    it "returns the admin" do
      expect(admin).to eq(User.admins.first)
    end
  end

  describe "has_many :messages" do
    it { is_expected.to have_many :messages } 
  end
  
  describe "has_many :notifications" do
    it { is_expected.to have_many :notifications }  
  end
  
  describe "has_many :carts" do
    it { is_expected.to have_many :carts }  
  end

  describe "has_one :chef_profile" do
    it { is_expected.to have_one :chef_profile }
  end

  describe "has_one :employee_profile" do
    it { is_expected.to have_one :employee_profile }
  end

  describe "has_one :user_profile" do
    it { is_expected.to have_one :user_profile }
  end

  describe "has_one :food_store, through: :chef_profile" do
    it { is_expected.to have_one :food_store }
  end

  describe "has_one :company, through: :employee_profile" do
    it { is_expected.to have_one :company }
  end  

  describe "has_secure_password" do
    it { is_expected.to have_secure_password }
  end

  describe "#from_omniauth" do
    context "with registered user" do
      it "using omniauth" do
        user = FactoryBot.create(:user, email: "manjeetsingh@facebook.com", provider: "facebook", uid: "12345678910")
        OmniAuth.config.test_mode = true
        expect(User.create_with_omniauth(OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          provider: "facebook",
            uid: "12345678910",
            info: {
              email: "demo@gmail.com",
              name: "Manjeet Singh"
            },
            credentials: {
              token: "abcdefg12345",
              refresh_token: "abcdefg12345",
              expires_at: DateTime.now,
            }
          }))).to eq(user)
      end
    end
  end
end