class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: {  rooms: rooms,
                    params: params }, status: 200 
  end

  def show
    room = Room.find_by(token: params[:token])
    if room
      render json: {  room: room,
                      params: params }, status: 200
    else 
      render json: { error: "Room/Application not found."}, status: 404
    end

  end

  def create
    room = Room.new room_params
    if room.save 
      render json: {  room_created: room,
                      params: params }, status: 200
    else 
      render json: { error: "Error creating room/application"}, status: 404
    end 
  end

  private 
  def room_params
    params.require(:room).permit(:token, :name)
  end
end
