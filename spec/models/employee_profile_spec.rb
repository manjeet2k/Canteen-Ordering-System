require 'rails_helper'

RSpec.describe EmployeeProfile, type: :model do
  subject(:employee_profile) { FactoryBot.build(:employee_profile) }

  describe ".employee_name_presence" do
    context "when employee is name present" do
      it "employee  having a name is valid" do
        expect(employee_profile).to be_valid
      end
    end
    context "when employee name is not present" do
      it "employee  having no name is invalid" do
        employee_profile.name = ""
        expect(employee_profile).not_to be_valid
      end
    end
  end

  describe ".employee_name_length" do
    context "with valid employee  name length" do
      it "employee  having name of length within 2 and 30 characters is valid" do
        expect(employee_profile).to be_valid
      end
    end
    context "with invalid employee  name length" do
      it "employee  not having name of length within 2 and 30 characters is invalid" do
        employee_profile.name = "S"
        expect(employee_profile).not_to be_valid
      end 
    end
  end

  describe ".employee_phone_length" do
    context "with valid phone number format" do
      it "employee  having phone number of length 10 characters is valid" do
        expect(employee_profile).to be_valid
      end
    end
    context "with invalid phone number format" do
      it "employee  not having phone number of valid format is invalid" do
        employee_profile.phone = "906532s"
        expect(employee_profile).not_to be_valid
      end 
    end
  end

  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }  
  end

  describe "belongs_to :company" do
    it { is_expected.to belong_to :company }  
  end
end
