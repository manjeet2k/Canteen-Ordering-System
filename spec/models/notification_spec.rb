require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe "Model Validation" do 
    it { is_expected.to belong_to :user }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_least(3).is_at_most(50) }
  end  
  
end
