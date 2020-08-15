class User < ApplicationRecord
  has_secure_password
  enum role: [:user, :employee, :chef]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 80, minimum: 9 } , 
            uniqueness: { case_sensitive: false } , format: { with: VALID_EMAIL_REGEX }  
  validates :password, presence: true, length: { maximum: 30, minimum: 6 } , on: :create 


  has_one  :chef_profile, dependent: :destroy
  has_one  :employee_profile, dependent: :destroy
  has_one  :user_profile, dependent: :destroy
  has_one  :food_store, through: :chef_profile
  has_one  :company, through: :employee_profile  
  has_many :carts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy

  scope :admins, -> { where(admin: true) }

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth["uid"], provider: auth["provider"])
    name = auth["info"]["name"].delete(" ").downcase
    user.email = "#{name}@#{auth["provider"]}.com"
    user.password = "pass123"
    if User.exists?(user.id)
      user
    else
      user.save!
      user
    end
  end
end
