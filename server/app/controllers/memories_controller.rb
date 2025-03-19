class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[ show edit update destroy ]

  # GET /memories
  def index
    if (current_user)
      @memories = current_user.memories
    else
      @memories = User.find(16).memories # TODO: Delete this line after implementing login/logout feature
    end

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

  # POST /memories
  def create
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

  # DELETE /memories/:id
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
        format.json { render json: @memory, status: :ok }
      else
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/:id
  def destroy
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

    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = Memory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def memory_params
      params.require(:memory).permit(:title, :content, :user_id, :restaurant_id, images: [], upload_images: [], remove_images: [])
    end
end
