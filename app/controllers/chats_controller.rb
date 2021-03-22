class ChatsController < ApplicationController
  def index 
    chats = chats_json(get_chats params[:room_token])
    render json: {  chats: chats}, status: 200
  end

  def show
    chat = get_chat(params[:room_token], params[:number])
    if chat
      render json: {  chat: chat}, status: 200
    else
      render json: {error: "Chat not found"}, status: 404
    end              
  end

  def create
    chat = get_chats(params[:room_token]).new 
    if chat.save
      render  json: { chat_created: chat}, status: 200
    else 
      render json: {error: 'Error creating chat.'}, status: 404
    end
  end

  def search
    chat = get_chat(params[:room_token], params[:chat_number])
    query = params[:query]
      result = Message.custom_search(query, chat.id)
      render json: {hits: result.size,
                    result: message_json(result)}
  end

end
