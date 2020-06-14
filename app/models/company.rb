class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :users, through: :employees
end
