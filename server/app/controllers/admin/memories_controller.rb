
class Admin::MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @memories = Memory.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @memories, status: :ok }
    end
  end

  def show
    @memory = Memory.find(params[:id])

    respond_to do |format|
      format.html { render :show, status: :ok }
      format.json { render json: @memory, status: :ok }
    end
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy

    respond_to do |format|
      format.html { redirect_to admin_memories_path, notice: "Memory was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def memory_params
    params.require(:memory).permit(:id)
  end
end
