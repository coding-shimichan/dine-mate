class User < ApplicationRecord
  has_secure_password
  
  has_many :wishlists, dependent: :destroy
  has_many :restaurants, through: :wishlists
  has_many :memories, dependent: :destroy
  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users

  validates :email, presence: true
  validates :password_digest, presence: true
end
