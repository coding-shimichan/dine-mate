
class Admin::WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @wishlists = Wishlist.all
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to admin_wishlists_path, notice: "Wishlist was successfully deleted."
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def wishlist_params
    params.require(:wishlist).permit(:id, :user_id, :restaurant_id)
  end
end
