class Cart < ApplicationRecord
  belongs_to :user
  has_many   :cart_items, dependent: :destroy
  has_many   :food_items, through: :cart_items

  def total
    cart_items.collect {|item| item.valid? ? item.sub_total : 0}.sum
  end

end
