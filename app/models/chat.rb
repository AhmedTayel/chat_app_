class Chat < ApplicationRecord
  belongs_to :room
  has_many :messages
  
  before_create :find_order
  after_create :update_chat_count, :start_message_count
  
  
  def as_json(options={})
    {
      # :room_token => Room.find_by(id: room_id).token,
      :chat_number => chat_number,
      :message_count => message_count,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end


  private 
  def find_order
    room = Room.find_by(id: self.room_id) 
    if room.chats.maximum(:chat_number)
      self.chat_number = room.chats.maximum(:chat_number) + 1
    else
      self.chat_number = 1;
    end
  end
  def update_chat_count
    room = Room.find_by(id: self.room_id)
    room.update(chat_count: Chat.where(room_id: room.id).count)
  end
  def start_message_count
    self.update(message_count: 0)
  end
  
end
