class ChatUser < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  belongs_to :last_read_message, class_name: "Message", optional: true

  # validate :chat_must_have_two_participants, if: -> { chat.present? }
  validate :chat_must_have_two_participants, on: :create, if: -> { chat.present? }

  private

  def chat_must_have_two_participants
    if chat.chat_users.count >= 2
      errors.add(:chat, "can only have two participants")
    end
  end
end
