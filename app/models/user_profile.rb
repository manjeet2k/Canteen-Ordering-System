class UserProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  VALID_PHONE_REGEX = /\A[6-9][0-9]{9}\z/

  validates :name,  presence: true, length: { maximum: 50, minimum: 3 }, uniqueness: true
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
end
