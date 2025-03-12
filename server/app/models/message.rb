class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :content, presence: true
  validates :user_id, presence: true
  validates :chat_id, presence: true

  scope :unread_by, ->(user, chat) {
    last_read_message_id = ChatUser.find_by(user: user, chat: chat)&.last_read_message_id
    if last_read_message_id
      where("id > ?", last_read_message_id)
    else
      all
    end
  }
end
