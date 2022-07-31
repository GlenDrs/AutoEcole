class RoomsController < ApplicationController
  before_action :check_teacher_admin, except: [:index, :show]
  before_action :set_room, only: %i[show index ]

  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages
    @room = Room.find(params[:id])
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

  def room_params
    #params.require(room:).permit(:name, :public_room)
  end
end
