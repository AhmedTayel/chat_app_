# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_token'

seed1 = RandomToken.gen("%1n").to_i
seed2 = RandomToken.gen("%1n").to_i

seed1.times do |index|
  room = Room.create({
    token: RandomToken.genf(5),
    name: "Application number: #{index+1}"
  })
  seed2.times do |i|
    chat = room.chats.create({})
    message = chat.messages.create({
      content: "This is a message at index: #{i+1}"
    })
  end
end
