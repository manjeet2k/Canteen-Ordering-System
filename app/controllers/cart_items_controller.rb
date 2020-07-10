class CartItemsController < ApplicationController

  def update
    item = CartItem.find(params[:id])
    if item.update(cart_items_params)
      flash[:success] = "Cart Updated"
      redirect_to cart_path
    else
      flash[:danger] = "failed"
      render cart_path
    end
  end

  private
  
  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end
  
end
