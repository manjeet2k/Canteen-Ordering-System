class CartsController < ApplicationController

  def add
    item = current_cart.cart_items.new(cart_items_params)
    require_same_food_store
    if item.save
      flash[:success] = "Item Added to Cart"
      redirect_back(fallback_location: menu_path)
    else
      flash[:danger] = "Food Item already in the cart"
      redirect_back(fallback_location: menu_path)
    end
  end

  def show
    @cart = current_cart
    @item = @cart.cart_items.order(:id)
  end

  def order
    check_cart
    @cart = current_cart
    unless current_user.carts.where(order_status: 0..2).count == 0    
      flash[:warning] = "Please wait till last order is completed!"
      redirect_back(fallback_location: cart_path)
    else
      if @cart.update cart_params
        flash[:success] = "Order placed Successfully!"
        Notification.create(user_id: 1, content: "You got new order to approve") 
        get_cart
        redirect_to order_show_path
      else
        flash[:danger] = "Something went wrong!"
        render cart_path
      end
    end
  end

  def order_show
    unless current_user.admin?
      @carts = current_user.carts
      # order_status = {"[Placed,0]", "[Recieved,1]", "[Preparing,2]", "[Delivered,3]"}
      @past_orders  = @carts.where(order_status: 3)
      @current_order = @carts.where(order_status: 0..2).first
    else
      @current_order = Cart.find params[:format]
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:order_status)
  end

  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end

  def check_cart
    if current_cart.cart_items.count == 0
      flash[:danger] = "Add some food items in the cart first"
      redirect_to root_path
    end
  end

  def require_same_food_store
    unless @cart.cart_items.first.food_item.food_store.id == @cart.cart_items.last.food_item.food_store.id
      @cart.cart_items.destroy_all
    end
  end

end
