class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update ]

  # GET /chats or /chats.json
  def index
    @chats = current_user.chats
  end

  def show
    @chat = Chat.find(params[:id])
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new
    @chat.users << current_user
    @chat.users << User.find(params[:user_id])

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: "Chat was successfully created.", status: :created }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  # def destroy
  #   @chat.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to user_chats_path(user_id: @user.id), status: :see_other, notice: "Chat was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def load_messages
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.includes(:user).order(created_at: :asc)
    render partial: "messages/messages", locals: { messages: @messages }
  end

  private

    # def set_user
    #   @user = User.find(params[:user_id])
    # end

    # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chat_params
    # params.fetch(:chat, {})
    params.require(:chat).permit(:id, :user_id)
  end
end
