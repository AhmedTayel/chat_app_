class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: {  rooms: rooms,
                    params: params }, status: 200 
  end

  def show
    room = Room.find_by(token: params[:token])
    chats = Chat.where(room_id: room.id)
    if room
      render json: {  room: room,
                      params: params }, status: 200
     
    else 
      render json: { error: "Room/Application not found."}
    end

  end

  def create
    room = Room.new room_params
    if room.save 
      render json: {  room: room,
                      params: params }, status: 200
    else 
      render json: { error: "Error creating room/application"}
    end 
  end

  private 
  def room_params
    params.require(:room).permit(:token, :name)
  end
end
