class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[ show edit update destroy update_direct destroy_direct ]
  before_action :set_user, only: %i[ index create ]

  # GET /memories or /memories.json
  def index
    @memories = current_user.memories

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @memories, status: :ok }
    end
  end

  # GET /memories/1 or /memories/1.json
  def show
    respond_to do |format|
      format.html { render :show, status: :ok }
      format.json { render json: @memory, status: :ok}
    end
  end

  # GET /memories/new
  def new
    @memory = current_user.memories.new(restaurant_id: params[:restaurant_id])
  end

  # GET /memories/1/edit
  def edit
  end

  # POST /memories or /memories.json
  def create
    if params[:memory][:upload_images].present?
      params[:memory][:images] = params[:memory][:upload_images]
    end

    update_params = memory_params.except(:remove_images, :upload_images)
    @memory = current_user.memories.new(update_params)

    respond_to do |format|
      if @memory.save
        format.html { redirect_to user_memory_path(user_id: @memory.user.id, id: @memory.id), notice: "Memory was successfully created.", status: :created }
        format.json { render json: @memory, status: :created }
        format.turbo_stream { redirect_to user_memory_path(user_id: @memory.user.id, id: @memory.id), notice: "Memory was successfully created.", status: :see_other }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_direct
    if params[:memory][:upload_images].present?
      params[:memory][:images] = params[:memory][:upload_images]
    end

    update_params = memory_params.except(:remove_images, :upload_images)
    @memory = current_user.memories.new(update_params)

    respond_to do |format|
      if @memory.save
        format.json { render json: @memory, status: :created }
      else
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memories/1 or /memories/1.json
  def update
    # Remove images
    if params[:memory][:remove_images].present?
      params[:memory][:remove_images].each do |image_id|
        @memory.images.find_by(id: image_id)&.purge
      end
    end

    # Save new images
    if params[:memory][:upload_images].present?
      params[:memory][:upload_images].each do |image|
        @memory.images.attach(image)
      end
    end

    update_params = memory_params.except(:remove_images, :upload_images, :images)

    respond_to do |format|
      if @memory.update(update_params)
        format.html { redirect_to user_memory_path(user_id: @memory.user.id, id: @memory.id), notice: "Memory was successfully updated.", status: :ok }
        format.json { render :show, status: :ok, location: user_memory_path(user_id: @memory.user.id, id: @memory.id)}
        # format.json { render :show, status: :ok, location: @memory}
        format.turbo_stream { redirect_to user_memory_path(user_id: @memory.user.id, id: @memory.id), status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_direct
    # Remove images
    if params[:memory][:remove_images].present?
      params[:memory][:remove_images].each do |image_id|
        @memory.images.find_by(id: image_id)&.purge
      end
    end

    # Save new images
    if params[:memory][:upload_images].present?
      params[:memory][:upload_images].each do |image|
        @memory.images.attach(image)
      end
    end

    update_params = memory_params.except(:remove_images, :upload_images, :images)

    respond_to do |format|
      if @memory.update(update_params)
        format.json { render json: @memory, status: :ok }
      else
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1 or /memories/1.json
  def destroy
    if (@memory.user != current_user)
      respond_to do |format|
        format.html { redirect_to @memory, notice: "Cannot delete other user's memory.", status: :unprocessable_entity }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end

    @memory.destroy!

    respond_to do |format|
      format.html { redirect_to user_memories_path(user_id: @memory.user.id), status: :see_other, notice: "Memory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_direct
    if (@memory.user != current_user)
      respond_to do |format|
        format.json { render json: { message: "Unprocessable entity." }, status: :unprocessable_entity }
      end
    else
      @memory.destroy!

      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = Memory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def memory_params
      params.require(:memory).permit(:title, :content, :user_id, :restaurant_id, images: [], upload_images: [], remove_images: [])
    end
end
