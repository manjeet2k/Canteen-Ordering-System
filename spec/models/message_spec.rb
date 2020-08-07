require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Model Validations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :cart }
  end
end
