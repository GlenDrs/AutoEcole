class RoomsController < ApplicationController
  before_action :check_teacher_admin, except: [:index, :show]
  before_action :set_room, only: %i[show]

  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages
    #@room = Room.find(params[:id])
    @message = Message.new
    #render 'index'
  end


  private
  def check_teacher_admin
    unless current_user.teacher != nil || current_user.admin == true
      redirect_to '/', :alert => "Don't have permission!"
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
