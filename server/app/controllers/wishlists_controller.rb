class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[ destroy ]

  # GET /wishlists or /wishlists.json
  def index
    if (current_user)
      @wishlists = current_user.wishlists
    else
      @wishlists = User.find(16).wishlists # TODO: Delete this line after implementing login/logout feature
    end

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @wishlists, status: :ok }
    end
  end

  # GET /wishlists/1 or /wishlists/1.json
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists or /wishlists.json
  def create
    @wishlist = Wishlist.new(user_id: params[:user_id], restaurant_id: params[:restaurant_id])

    respond_to do |format|
      if @wishlist.save
        # format.html { redirect_to @wishlist, notice: "Wishlist was successfully created." }
        format.html { redirect_to restaurant_path(id: params[:restaurant_id]), notice: "Wishlist was successfully created.", status: :created }
        format.json { render json: @wishlist, status: :created }
      else
        format.html { redirect_to restaurant_path(id: params[:restaurant_id]), notice: "Failed to create Wishlist.", status: :unprocessable_entity }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1 or /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: "Wishlist was successfully updated." }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1 or /wishlists/1.json
  def destroy
    # @wishlist = @user.wishlists.find_by(restaurant_id: params[:id])
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy!

    respond_to do |format|
      # format.html { redirect_to wishlists_path, status: :see_other, notice: "Wishlist was successfully destroyed." }
      # format.html { redirect_to restaurant_path(id: params[:id]), notice: "Restaurant was successfully removed from your wishlist." }
      format.html { redirect_to restaurant_path(id: @wishlist.restaurant_id), notice: "Restaurant was successfully removed from your wishlist.", status: :see_other }
      format.json { head :no_content }
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
