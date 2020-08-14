require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:cart) { FactoryBot.create(:cart) }
  let(:placed_order) { FactoryBot.create(:placed_order) }
  let(:recieved_order) { FactoryBot.create(:recieved_order) }
  let(:cooking_order) { FactoryBot.create(:cooking_order) }
  let(:delivered_order) { FactoryBot.create(:delivered_order) }
  let(:cart_item) { FactoryBot.create(:cart_item, cart_id: cart.id) }
  let(:cart_item_2) { FactoryBot.create(:cart_item_2, cart_id: cart.id) }

  describe "model association test" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to(:food_store).optional }
  end

  describe "scope tests" do
    it "includes all the placed carts" do
      expect(Cart.to_approve).to include(placed_order)
    end

    it "includes all the orders to be  forwarded to food stores" do
      expect(Cart.live_orders).to include(recieved_order, cooking_order)
    end

    it "includes all the active orders" do
      expect(Cart.active_orders).to include(placed_order, recieved_order, cooking_order)
    end

    it "includes all the finished orders" do
      expect(Cart.delivered_orders).to include(delivered_order)
    end
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
