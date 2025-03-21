class Api::WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[ destroy update ]

  # GET /wishlists
  # => Returns current user's wishlists
  def index
    if (current_user)
      @wishlists = current_user.wishlists
    else
      @wishlists = User.find(16).wishlists # TODO: Delete this line after implementing login/logout feature
    end

    render json: @wishlists, status: :ok
  end

  # GET /wishlists/1
  def show
  end

  # POST /wishlists
  def create
    @wishlist = Wishlist.new(user_id: params[:user_id], restaurant_id: params[:restaurant_id])

    if @wishlist.save
      render json: @wishlist, status: :created 
    else
      render json: @wishlist.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      format.json { render :show, status: :ok, location: @wishlist }
    else
      format.json { render json: @wishlist.errors, status: :unprocessable_entity }
    end
end

  # DELETE /wishlists/1
  def destroy
    if @wishlist.destroy
      head :no_content
    else
      render json: { error: "Failed to delete wishlist" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :restaurant_id)
    end
end
