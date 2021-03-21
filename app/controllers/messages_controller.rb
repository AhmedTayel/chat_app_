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
    chat = room.chats.find_by(chat_number: params[:chat_number])
    message = chat.messages.new(message_params)
    if message.save
      render json: {  message_created: message,
                      params: params }, status: 200
    else
      render json: { error: "Cannot create message"}
    end  
  end

  def update
    room = Room.find_by(token: params[:room_token])
    chat = room.chats.find_by(chat_number: params[:chat_number])
    message = chat.messages.find_by(message_number: params[:message_number])
    if message.update message_params
      render json: { message_updated: message,
                      params: params}, status: 200
    else
      render json: { error: "Couldn't update message"}, status: 404
    end

  end

  private 
  def message_params
    params.require(:message).permit(:content)
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
