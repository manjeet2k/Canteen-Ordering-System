class Message < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  after_create_commit  { MessageRelayJob.perform_later(self) }
end
