class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: {  applications: rooms }, status: 200 
  end

  def show
    room = get_room params[:token]
    if room
      render json: {  application: room }, status: 200
    else 
      render json: { error: "Application not found."}, status: 404
    end

  end

  def create
    room = Room.new room_params
    if room.save 
      render json: {  application_created: room }, status: 200
    else 
      render json: { error: "Error creating application"}, status: 404
    end 
  end
  def update
    room = get_room params[:token]
    if room.update room_params
      render json: { application_updated: room }, status: 200 
    else
      render json: {error: "Could not update application."}, status: 404
    end
  end

  private 
  def room_params
    params.require(:room).permit(:name)
  end
end
