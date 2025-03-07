class Admin::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @chats = Chat.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @chats, status: :ok }
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to admin_chats_path, notice: "Chat was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end 
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def chat_params
    params.require(:chat).permit(:id)
  end
end
