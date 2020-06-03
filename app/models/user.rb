class User < ApplicationRecord
  has_secure_password
  enum role: [:user, :employee, :chef]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 80, minimum: 5 } , 
            uniqueness: { case_sensitive: false } , format: { with: VALID_EMAIL_REGEX }  
  validates :password, presence: true, length: { maximum: 30, minimum: 6 } , on: :create 
  
end
