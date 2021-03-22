require 'elasticsearch/model'
class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :chat
  before_create :find_order
  after_create :update_message_count
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  
  settings analysis: {
    filter: {
      edge_ngram_filter: {
        type: "edge_ngram",
        min_gram: "2",
        max_gram: "20",
      }
    },
    analyzer: {
      edge_ngram_analyzer: {
        type: "custom",
        tokenizer: "standard",
        filter: ["lowercase", "edge_ngram_filter"]
      }
    }
  } do
    mappings dynamic: true do
      indexes :content, type: :text, analyzer: "edge_ngram_analyzer"
      # indexes :chat_id, type: :long
    end
  end

  def as_json(options={})
    {
      # :chat_id => chat_id,
      :message_number => message_number,
      :content => content,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end

  def self.custom_search(query, chat_id)
    self.search({
      query: {
        bool: {
          must: [
          {
            multi_match: {
              query: query,
              fields: [:content]
            }
          },
          {
            match: {
              chat_id: chat_id
            }
          }]
        }
      }
    })
  end
  def as_indexed_json(*)
    as_json(include: { message: { only: [:id, :content, :chat_id] } })
  end
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
