class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :user, dependent: :destroy
end
