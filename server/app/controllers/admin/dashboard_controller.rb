class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end
end
