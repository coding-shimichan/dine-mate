class ChatUser < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validate :chat_must_have_two_participants, if: -> { chat.present? }

  private

  def chat_must_have_two_participants
    if chat.users.count >= 2
      errors.add(:chat, "can only have two participants")
    end
  end
end
