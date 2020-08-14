module CartsHelper  

  def get_cart
    if current_user.carts.count > 0 && current_cart.order_status.nil?
      current_cart
    else
      set_cart
    end
  end

  def set_cart
    @cart = current_user.carts.create
  end

  def current_cart
    @cart ||= current_user.carts.last
  end 

  def active_order
    @active_order ||= current_user.carts.active_orders.first
  end
end
