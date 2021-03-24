# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_token'
require 'faker'

seed1 = 10
seed2 = 10
seed3 = 10

seed1.times do |index|
  room = Room.create({
    token: RandomToken.genf(5),
    name: Faker::JapaneseMedia::DragonBall.character
  })
  seed2.times do |i|
    chat = room.chats.create({})
    seed3.times do |x|
      message = chat.messages.create({
        content: Faker::Quote.most_interesting_man_in_the_world
      })
    end
  end
end


## Don't change
Message.__elasticsearch__.delete_index!
Message.__elasticsearch__.create_index!
Message.import force: true
## Don't change