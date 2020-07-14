class Company < ApplicationRecord
  has_many :employee_profiles, dependent: :destroy
  has_many :users, through: :employee_profiles

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }, uniqueness: true
end