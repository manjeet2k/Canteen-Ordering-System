class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    html = ApplicationController.render partial:"pages/content", locals: {notification: notification}, formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.user_id}", html: html
  end
end
