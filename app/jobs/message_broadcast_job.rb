class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    payload = {
      chat_id: message.chat_id,
      message_number: message.message_number,
      content: message.content
    }
    ActionCable.server.broadcast 'chat_channel', payload
  end
end
