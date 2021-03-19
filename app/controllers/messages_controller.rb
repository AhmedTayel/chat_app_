class MessagesController < ApplicationController
  def index
    room = Room.find_by(token: params[:room_token])
    messages = room.chats.find_by(chat_number: params[:chat_number]).messages
    parsed_messages = message_json messages 
    render json: {  messages: parsed_messages,
                    params: params }, status: 200
  end

  def show
    room = Room.find_by(token: params[:room_token])
    message = room.chats.find_by(chat_number: params[:chat_number]).messages.find_by(message_number: params[:message_number])
    if message
      render json: {  message: message,
                      params: params }, status: 200
    else
      render json: {error: "Couldn't find message."}
    end
  end

  def create
    room = Room.find_by(token: params[:room_token])
    message = room.chats.find_by(chat_number: params[:chat_number]).messages.new(message_params)
    if message.save
      render json: {  message: message,
                      params: params }, status: 200
    else
      render json: { error: "Cannot create room"}
    end  
  end

  private 
  def message_params
    params.require(:message).permit(:content, :message_number)
  end
  
  def message_json messages
    
    new_messages = []
    messages.each_with_index do |message, index| 
    new_messages.push({
      index+1 => message,
    })
    end
    new_messages
  end
end
