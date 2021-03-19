class Room < ApplicationRecord
  has_many :chats 
  after_create :start_chat_count

  def as_json(options={})
    {
      
      :token => token,
      :name => name,
      :chat_count => chat_count,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end
  
  private
  def start_chat_count
    self.update(chat_count: 0)
  end
end
