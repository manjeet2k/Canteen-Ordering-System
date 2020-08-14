class MessagesController < ApplicationController
  def index
    if logged_in?
      return redirect_to error_path if current_user.admin?

      if !current_user.chef?
        if active_order
          return redirect_to error_path if active_order.user != current_user
          @messages = active_order.messages
        end
      else
        @active_order = Cart.find(params[:cart_id])
        return redirect_to error_path if @active_order.store != current_user.food_store
        return redirect_to dashboard_chef_profiles_path if @active_order.order_status == "Delivered"
        @messages = @active_order.messages
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
