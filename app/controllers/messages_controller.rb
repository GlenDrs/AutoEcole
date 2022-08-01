class MessagesController < ApplicationController
  #before_action :set_message, only: %i[new create show destroy]

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
      #ActionCable.server.broadcast("room_channel", {content: @message.content})
      #RoomChannel.broadcast_to @message.room, @message.content
      redirect_to room_path(id: message_params[:room_id])
    end
  end

  def destroy
  end

  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end

end
