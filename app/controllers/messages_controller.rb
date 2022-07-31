class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      RoomChannel.broadcast_to @message.room_id, @message
      #redirect_to room_path(message_params[:room_id])
    end
    #SendMessageJob.perform_later(@message)
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end

end
