class MessagesController < ApplicationController
  before_action :check_teacher

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    respond_to do |format|
      if @message.save
=begin
      #ActionCable.server.broadcast("room_channel", {content: @message.content})
      #RoomChannel.broadcast_to @message.room, @message.content
      redirect_to room_path(id: message_params[:room_id])
    end
=end
        format.html { redirect_to room_path(message_params[:room_id]) }
        format.js
      end
    end
  end

  def destroy
  end

  private
  def check_teacher
    unless current_user.teacher != nil
      redirect_to '/', :alert => "Don't have permission!"
    end
  end

  def message_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end

end
