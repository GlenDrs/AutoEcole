class Admin::MessagesController < ApplicationController
  before_action :authenticate_admin

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

  def authenticate_admin
    unless current_user&.admin
      flash[:error] = "You're not a adminstrator"
      redirect_to root_path
    end
  end

end
