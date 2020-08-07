require 'rails_helper'

RSpec.describe FoodCategory, type: :model do
  subject(:category) { FactoryBot.build(:food_category) }

  describe ".category_name_validation" do
    context "when name is present" do
      it "category having a name is valid" do
        expect(category).to be_valid
      end
    end
    context "when name is not present" do
      it "category having no name is invalid" do
        category.name = ""
        expect(category).not_to be_valid
      end
    end

    describe "model validation test" do
      it { is_expected.to validate_uniqueness_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(40) }
      it { is_expected.to_not allow_value("as123").for(:name) }
      it { is_expected.to allow_value("Thai").for(:name) } 
    end   
  end
end
