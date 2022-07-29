class RoomsController < ApplicationController
  before_action :set_room, only: %i[show ]

  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages
    @room = Room.find(params[:id])
    #render 'index'
  end


  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    #params.require(room:).permit(:name, :public_room)
  end


end
