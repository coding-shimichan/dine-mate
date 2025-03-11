class Admin::MessagesController < ApplicationController
  # before_action :set_message, only: %i[ show edit update destroy ]
  # before_action :set_chat, only: %i[ index ]

  # GET /messages or /messages.json
  def index
    @messages = Chat.find(params[:chat_id]).messages.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @messages, status: :ok }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:chat_id)
    end
end
