class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :content, presence: true
  validates :user_id, presence: true
  validates :chat_id, presence: true
end
