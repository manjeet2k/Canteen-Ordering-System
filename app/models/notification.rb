class Notification < ApplicationRecord
  belongs_to :user

  after_create_commit  { NotificationRelayJob.perform_later(self) }
end
