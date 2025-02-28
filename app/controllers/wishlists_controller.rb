class WishlistsController < ApplicationController
  # before_action :set_wishlist, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ show edit update destroy create new]

  # GET /wishlists or /wishlists.json
  def index
    @wishlists = Wishlist.all
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
    @wishlist = @user.wishlists.new(wishlist_params)

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: "Wishlist was successfully created." }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new, status: :unprocessable_entity }
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
    @wishlist.destroy!

    respond_to do |format|
      format.html { redirect_to wishlists_path, status: :see_other, notice: "Wishlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # def set_wishlist
    #   @wishlist = Wishlist.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :restaurant_id)
    end
end
