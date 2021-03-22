class ApplicationController < ActionController::API
  private 
  def load_rooms
    Room.includes(:chats)
  end
  def get_room token
    load_rooms.find_by(token: token)
  end

  def get_chats token
    load_rooms.find_by(token: token).chats.includes(:messages)
  end

  def get_chat token, chat_number
    get_chats(token).find_by(chat_number: chat_number)
  end

  def get_messages token, chat_number
    get_chat(token, chat_number).messages
  end

  def get_message token, chat_number, message_number
    get_messages(token, chat_number).find_by(message_number: message_number)
  end

  def chats_json chats
    new_chats = []
    chats.each_with_index do |chat, index| 
    new_chats.push({
      index+1 => chat,
    })
    end
    new_chats
  end
  
  def message_json messages
    
    new_messages = []
    messages.each_with_index do |message, index| 
    new_messages.push({
      index+1 => {message_number: message.message_number,
                  content: message.content,
                  created_at: message.created_at,
                  updated_at: message.updated_at}
    })
    end
    new_messages
  end
end
