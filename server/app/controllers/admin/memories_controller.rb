
class Admin::MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @memories = Memory.all
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to admin_memories_path, notice: "Memory was successfully deleted."
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def memory_params
    params.require(:memory).permit(:id)
  end
end
