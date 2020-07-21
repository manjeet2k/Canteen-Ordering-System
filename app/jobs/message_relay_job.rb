class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = ApplicationController.render partial:"messages/content", locals: {message: message}, formats: [:html]
    ActionCable.server.broadcast "cart_channel_#{message.cart_id}", html: html     
  end
end
