class Admin::MessagesController < ApplicationController
  #before_action set_admin_msg, only: %i[:new :create :destroy]
  def new
    @message_admin = Message.new
  end

  def show
  end

  def create
    @message_admin = Message.new(message_params)
    if @message_admin.save
      redirect_to room_path(id: message_params[:room_id])
    end
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end
end
