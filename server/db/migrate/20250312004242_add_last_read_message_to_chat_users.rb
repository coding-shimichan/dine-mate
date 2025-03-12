class AddLastReadMessageToChatUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :chat_users, :last_read_message, foreign_key: { to_table: :messages }, index: true
  end
end
