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
    @item = current_cart.cart_items.order(:id)
  end

  def update
    item = CartItem.find(params[:id])
    if item.update(cart_items_params)
      flash[:success] = "Cart Updated"
      redirect_back(fallback_location: cart_path)
    else
      flash[:danger] = "failed"
      redirect_back(fallback_location: cart_path)
    end
  end

  private
  
  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end

  def cart_update_params
    params.require(:cart_item).permit(:quantity)
  end

  def require_same_food_store
    unless @cart.cart_items.first.food_item.food_store.id == @cart.cart_items.last.food_item.food_store.id
      @cart.cart_items.destroy_all
    end
  end
end
