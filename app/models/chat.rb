class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages

  scope :with_participant, ->(user_id) {
    joins(:chat_users).where(chat_users: {user_id: user_id}).distinct
  }
end
