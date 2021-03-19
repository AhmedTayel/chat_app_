class Room < ApplicationRecord
  has_many :chats 
  after_create :start_chat_count

  
  private
  def start_chat_count
    self.update(chat_count: 0)
  end
end
