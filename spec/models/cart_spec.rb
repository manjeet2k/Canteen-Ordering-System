require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:cart) { FactoryBot.create(:cart) }
  let(:cart_item) { FactoryBot.create(:cart_item, cart_id: cart.id) }
  let(:cart_item_2) { FactoryBot.create(:cart_item_2, cart_id: cart.id) }

  describe "model association test" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to(:food_store).optional }
  end

  describe "#total_instance_method" do
    it "should return cart total" do
      expect(cart_item.sub_total + cart_item_2.sub_total).to eq(cart.total)
    end
  end

  describe "#store_instance_method" do
    it "should return food store" do
      expect(cart_item.food_item.food_store).to eq(cart.store)
    end
  end

end
