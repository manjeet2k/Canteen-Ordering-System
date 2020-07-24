class MessagesController < ApplicationController
  def index
    if logged_in?
      return redirect_to error_path if current_user.admin?
      unless current_user.chef?
        if placed_cart
          return redirect_to error_path if placed_cart.user != current_user
          @messages = placed_cart.messages
        end
      else
        @placed_cart = Cart.find(params[:cart_id])
        return redirect_to error_path if @placed_cart.store != current_user.food_store
        @messages = placed_cart.messages
      end
    else  
      redirect_to error_path
    end
  end

  def create
    message = Message.new(msg_params)
    if message.save
      redirect_to messages_index_path unless current_user.chef?
      redirect_to messages_index_path(cart_id: message.cart_id) if current_user.chef?
    end
  end

  private 

  def msg_params
    params.require(:message).permit(:cart_id, :user_id, :body)
  end
end