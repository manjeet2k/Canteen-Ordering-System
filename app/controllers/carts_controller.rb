class CartsController < ApplicationController

  def add
    cart_item = current_cart.cart_items.new(cart_items_params)

    if same_food_store
      if cart_item.save
        flash[:success] = "Item Added to Cart"
        redirect_to root_path
      else
        flash[:danger] = "Food Item already in the cart"
        redirect_to root_path
      end
    else
      flash[:warning] = "Clear cart first to add items from different store!"
      redirect_to root_path
    end
  end

  def show
    @cart_items = current_cart.cart_items
  end

  def order
    check_cart
    
    if current_user.carts.active_orders.count == 0    
      if current_cart.update cart_params
        flash[:success] = "Order placed Successfully!"

        if current_cart.total > 300
          current_user.user_profile.update(credit: current_user.user_profile.credit*0.8) if current_user.user?
          current_user.employee_profile.update(credit: current_user.employee_profile.credit*0.8) if current_user.employee?
        end
        
        User.admins.each do |admin|
          Notification.create(user_id: admin.id, content: "You got new order to approve")
        end
        
        get_cart
        redirect_to order_show_path
      else
        flash[:danger] = "Something went wrong!"
        render cart_path
      end
    else
      flash[:warning] = "Please wait till last order is completed!"
      redirect_back(fallback_location: cart_path)
    end      
  end

  def reorder
    @cart = Cart.find params[:id]

    if current_user.carts.active_orders.count == 0  
      current_cart.cart_items.delete_all

      @cart.cart_items.each do |cart_item|
        current_cart.cart_items.create(food_item_id: cart_item.food_item.id, quantity: cart_item.quantity)
      end
      
      if current_cart.update(order_status: "Placed")
        flash[:success] = "Order placed Successfully!"

        if cart.total > 300
          current_user.user_profile.update(credit: current_user.user_profile.credit*0.8) if current_user.user? && current_user.user_profile.credit > 0 
          current_user.employee_profile.update(credit: current_user.employee_profile.credit*0.8) if current_user.employee? && current_user.employee_profile.credit > 0 
        end
        
        User.admins.each do |admin|
          Notification.create(user_id: admin.id, content: "You got new order to approve")
        end
        
        get_cart
        redirect_to order_show_path
      else
        flash[:danger] = "Something went wrong!"
        render cart_path
      end
    else
      flash[:warning] = "Please wait till last order is completed!"
      redirect_back(fallback_location: cart_path)
    end      
  end

  def order_show
    if current_user.admin?
      if params[:format]
        @current_order = Cart.find params[:format]
      else
        redirect_to error_path
      end
    else
      @carts = current_user.carts
      @past_orders   = @carts.delivered_orders
      @current_order = @carts.active_orders.first     
    end
  end

  def set_favourite
    @cart = Cart.find params[:id]
    @cart.toggle!(:favourite)
    if @cart.favourite
      flash[:success] = "Added to favourites"
    else
      flash[:danger] = "Removed from favourites"
    end

    redirect_to order_history_user_profiles_path if current_user.user?
    redirect_to order_history_employee_profiles_path if current_user.employee?
  end

  private

  def cart_params
    params.require(:cart).permit(:order_status, :food_store_id)
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
  
  # Ensures Cart Items From Same Food Store 
  def same_food_store
    unless @cart.cart_items.first.food_item.food_store.id == @cart.cart_items.last.food_item.food_store.id
      return false
    end
    true
  end

end
