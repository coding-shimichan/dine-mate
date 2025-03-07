class MessagesController < ApplicationController
  # before_action :set_message, only: %i[ show edit update destroy ]
  before_action :set_chat, only: %i[ index create ]

  # GET /messages or /messages.json
  def index
    @messages = @chat.messages.all
    @message = @chat.messages.new
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    # @message = Message.new(message_params)
    @message = @chat.messages.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to chat_messages_path(chat_id: @message.chat.id), notice: "Message was successfully created.", status: :created }
        format.json { render @message, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    # def set_message
    #   @message = Message.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:user_id, :chat_id, :content, :is_read)
    end
end
