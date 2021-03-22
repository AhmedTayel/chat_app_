class MessagesController < ApplicationController
  def index
    parsed_messages = message_json(get_messages(params[:room_token], params[:chat_number]))
    render json: {  messages: parsed_messages }, status: 200
  end

  def show
    message = get_message(params[:room_token], params[:chat_number], params[:message_number])
    if message
      render json: {  message: message }, status: 200
    else
      render json: {error: "Couldn't find message."}
    end
  end

  def create
    message = get_messages(params[:room_token], params[:chat_number]).new(message_params)
    if message.save
      render json: {  message_created: message }, status: 200
    else
      render json: { error: "Cannot create message"}
    end  
  end

  def update
    message = get_message(params[:room_token], params[:chat_number], params[:message_number])
    if message.update message_params
      render json: { message_updated: message}, status: 200
    else
      render json: { error: "Couldn't update message"}, status: 404
    end

  end

  private 
  def message_params
    params.require(:message).permit(:content)
  end
  
end
