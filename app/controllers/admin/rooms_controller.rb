module Admin
  class RoomsController < ApplicationController
    before_action :authenticate_admin

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(name: room_parms[:name], public_room: room_parms[:public_room], user_id: current_user.id)
      @room.save
      redirect_to rooms_path
    end

    def destroy
    end

    private
    def authenticate_admin
      unless current_user&.admin
      flash[:error] = "You're not an admin! "
      redirect_to root_path
      end
    end

    def room_parms
      params.require(:room).permit(:name, :public_room)
    end

  end
end
