class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :wishlists, dependent: :destroy
  has_many :restaurants, through: :wishlists
  has_many :memories, dependent: :destroy
  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users

  validates :email, presence: true
  validates :password, presence: true, on: :create
end
