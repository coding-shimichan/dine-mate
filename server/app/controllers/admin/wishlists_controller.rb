
class Admin::WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @wishlists, status: :ok }
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to admin_wishlists_path, notice: "Wishlist was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end 
  end

  private

  def require_admin
    redirect_to root_path, alert: "管理者権限が必要です", status: :forbidden unless current_user.admin?
  end

  def wishlist_params
    params.require(:wishlist).permit(:id, :wishlist_id, :restaurant_id)
  end
end
