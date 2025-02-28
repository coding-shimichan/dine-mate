class User < ApplicationRecord
  has_secure_password
  
  has_many :wishlists, dependent: :destroy
  has_many :restaurants, through: :wishlists
  has_many :memories, dependent: :destroy

  validates :email, presence: true
  validates :password_digest, presence: true
end
