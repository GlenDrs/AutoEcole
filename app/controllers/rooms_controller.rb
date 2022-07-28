class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
  end


  private
  def room_params
    #params.require(room:).permit(:name, :public_room)
  end


end
