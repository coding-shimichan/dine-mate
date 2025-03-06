class Admin::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to admin_chats_path, notice: "Chat was successfully deleted."
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def chat_params
    params.require(:chat).permit(:id)
  end
end
