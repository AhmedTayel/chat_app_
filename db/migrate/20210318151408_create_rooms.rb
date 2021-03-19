class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :token
      t.string :name
      t.integer :chat_count

      t.timestamps
    end
    add_index :rooms, :token, unique: true
  end
end
