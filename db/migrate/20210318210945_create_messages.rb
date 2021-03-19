class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.integer :message_number
      t.string :content

      t.timestamps
    end
  end
end
