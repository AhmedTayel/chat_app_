class Message < ApplicationRecord
  belongs_to :chat

  before_create :find_order
  after_create :update_message_count


  private 
  def find_order
    chat = Chat.find_by(id: self.chat_id)
    if chat.messages.maximum(:message_number)
      self.message_number = chat.messages.maximum(:message_number) + 1
    else
      self.message_number = 1;
    end
  end
  def update_message_count
    chat = Chat.find_by(id: self.chat_id)
    chat.update(message_count: Message.where(chat_id: chat.id).count)
  end
end
