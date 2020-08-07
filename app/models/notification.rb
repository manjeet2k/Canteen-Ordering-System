class Notification < ApplicationRecord
  belongs_to :user

  validates :content,  presence: true, length: { maximum: 50, minimum: 3 }

  after_create_commit  { NotificationRelayJob.perform_later(self) }
end
