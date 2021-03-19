class Room < ApplicationRecord
  has_many :chats 
  after_create :start_chat_count

end
