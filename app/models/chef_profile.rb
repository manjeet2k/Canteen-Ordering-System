class ChefProfile < ApplicationRecord
  mount_uploaders :images, ImageUploader
  
  belongs_to :food_store
  belongs_to :user, dependent: :destroy

  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i
  VALID_PHONE_REGEX = /\A[6-9][0-9]{9}\z/

  validates :name,  presence: true, format: { with: VALID_NAME_REGEX }, length: { maximum: 50, minimum: 3 }, uniqueness: true
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
end
