class RoomChannel < ApplicationCable::Channel
=begin
  def subscribed
    #stream_from "room_channel"
    #reject unless params[:room_id]

    #room = Room.find params[:room_id]
    #stream_for room
  end

  def unsubscribed
    #Any cleanup needed when channel is unsubscribed
  end
=end
end
