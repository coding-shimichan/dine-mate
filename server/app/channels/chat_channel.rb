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
    message = chat.messages.create(content: data["content"], user_id: @current_user.id)

    ChatChannel.broadcast_to(chat, message: render_message(message))
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message })
  end
end
