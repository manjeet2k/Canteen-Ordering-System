class Cart < ApplicationRecord
  enum order_status: [:Placed, :Recieved, :Cooking, :Delivered]

  belongs_to :user
  belongs_to :food_store, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :food_items, through: :cart_items
  has_one :review, dependent: :destroy

  scope :to_approve,       -> { where(order_status: 0) }
  scope :live_orders,      -> { where(order_status: 1..2) }
  scope :active_orders,    -> { where(order_status: 0..2) }
  scope :delivered_orders, -> { where(order_status: 3) }

  def total
    cart_items.collect {|item| item.valid? ? item.sub_total : 0}.sum
  end

  def store
    food_items.first.food_store
  end
end
