class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:chat_id])
    @current_user = User.find(params[:user_id])
    stream_for chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    chat = Chat.find(data["chat_id"])
    message = chat.messages.create(content: data["content"], user_id: data["user_id"])
    html_content = render_message(message)

    ChatChannel.broadcast_to(chat, {
      type: "new_message",
      sender_id: message.user_id,
      html_content: html_content
    })
  end

  def mark_as_read(data)
    chat_user = ChatUser.find_by(chat_id: data["chat_id"], user_id: data["reader_id"])
    return unless chat_user

    chat_user.update!(last_read_message_id: data["last_read_message_id"])

    ChatChannel.broadcast_to(chat_user.chat, {
      type: "update_read_status",
      reader_id: data["reader_id"],
      last_read_message_id: data["last_read_message_id"]
    })
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message, requester_id: nil })
  end
end
