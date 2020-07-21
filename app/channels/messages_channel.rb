class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "cart_channel_#{params[:cartId]}" if current_user && !current_user.admin?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
