class CartItemsController < ApplicationController
  
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

  def delete
    item = CartItem.find(params[:id])
    item.destroy
    flash[:success] = "Removed"
    redirect_to cart_path
  end 

  private
  
  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end
  
end