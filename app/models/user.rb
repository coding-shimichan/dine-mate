class User < ApplicationRecord
  has_secure_password
  
  has_many :wishlists, dependent: :destroy
  has_many :restaurants, through: :wishlists

  validates :email, presence: true
  validates :password_digest, presence: true
end
