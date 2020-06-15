class Chef < ApplicationRecord
  belongs_to :food_store
  belongs_to :user, dependent: :destroy
end
