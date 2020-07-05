module CartsHelper  

  def get_cart
    if session[:cart_id] 
      @cart ||= Cart.find session[:cart_id]
    elsif current_user.carts.count > 0
      unless current_cart.final
        @cart = current_cart
      else
        set_cart
      end
    else
      set_cart
    end
  end

  def set_cart
    @cart = current_user.carts.create
    session[:cart_id] = @cart.id
    @cart
  end

  def current_cart
    current_user.carts.last
  end

end
