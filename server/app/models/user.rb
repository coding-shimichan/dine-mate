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
  has_many :messages

  validates :email, presence: true
  validates :password, presence: true, on: :create

  def chat_with?(other_user)
    chats.joins(:users).where(users: { id: other_user.id }).exists?
  end

  def chat_with(other_user)
    chats.joins(:users).where(users: { id: other_user.id }).distinct.first
  end
end
