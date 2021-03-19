class ChatsController < ApplicationController
  def index
    room  = Room.find_by(token: params[:room_token])
    chats = room.chats
    parsed_chats = chats_json chats
    render json: {  chats: parsed_chats,
                    params: params }, status: 200
  end

  def show
    room  = Room.find_by(token: params[:room_token])
    chat = room.chats.find_by(chat_number: params[:number])
    if chat
      render json: {  chat: chat,
                      params: params }, status: 200
    else
      render json: {error: "Chat not found"}, status: 404
    end              
  end

  def create
    room  = Room.find_by(token: params[:room_token])
    chat = room.chats.new 
    if chat.save
      render  json: { chat_created: chat,
                      params: params }, status: 200
    else 
      render json: {error: 'Error creating chat.'}, status: 404
    end
  end

  private
  def chats_json chats
    new_chats = []
    chats.each_with_index do |chat, index| 
    new_chats.push({
      index+1 => chat,
    })
    end
    new_chats
  end
end
