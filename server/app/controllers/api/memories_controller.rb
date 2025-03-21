class Api::MemoriesController < ApplicationController
  before_action :authenticate_devise_api_token!
  before_action :set_memory, only: %i[ show update destroy ]

  # GET /api/memories
  # => Returns current user's memories
  def index
    @memories = current_devise_api_user.memories
    render json: @memories, status: :ok
  end

  # GET /api/memories/1 or /memories/1.json
  def show
    render json: @memory, status: :ok
  end

  # POST /api/memories
  def create
    if params[:memory][:upload_images].present?
      params[:memory][:images] = params[:memory][:upload_images]
    end

    update_params = memory_params.except(:remove_images, :upload_images)
    @memory = current_devise_api_user.memories.new(update_params)

    if @memory.save
      render json: @memory, status: :created
    else
      render json: @memory.errors, status: :unprocessable_entity 
    end
  end

  # PUT /api/memories/:id
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

    if @memory.update(update_params)
      render json: @memory, status: :ok 
    else
      render json: @memory.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /api/memories/:id
  def destroy
    if (@memory.user != current_devise_api_user)
      render json: { message: "Unprocessable entity." }, status: :unprocessable_entity 
    else
      @memory.destroy!
      head :no_content 
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
