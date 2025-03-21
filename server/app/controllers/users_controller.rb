class UsersController < ApplicationController
  before_action :set_user, only: %i[ show memories wishlists ]

  # GET /users or /users.json
  # def index
  #   @users = User.all
  # end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users or /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: "User was successfully created." }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: "User was successfully updated." }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # GET /users/:id/wishlists
  def wishlists
    @wishlists = @user.wishlists

    respond_to do |format|
      format.html { render "wishlists/index", locals: { wishlists: @wishlists }, status: :ok }
      format.json { render json: @wishlists, status: :ok }
    end
  end

  # GET /users/:id/memories
  def memories
    @memories = @user.memories

    respond_to do |format|
      format.html { render "memories/index", locals: { memories: @memories }, status: :ok }
      format.json { render json: @memories, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if (params[:user_id].present?)
        @user = User.find(params[:user_id])
      elsif (params[:id].present?)
        @user = User.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
