class User < ApplicationRecord
  has_secure_password
  enum role: [:user, :employee, :chef]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 80, minimum: 5 } , 
            uniqueness: { case_sensitive: false } , format: { with: VALID_EMAIL_REGEX }  
  validates :password, presence: true, length: { maximum: 30, minimum: 6 } , on: :create 
  

  has_one  :chef_profile
  has_one  :employee_profile
  has_one  :user_profile
  has_one  :food_store, through: :chef_profile
  has_one  :company, through: :employee_profile
  
  has_many :carts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy
  
end
