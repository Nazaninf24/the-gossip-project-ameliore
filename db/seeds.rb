# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker' 

City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Link.destroy_all
#PrivateMessage.destroy_all

Faker::Config.locale = 'fr'



# 10.times do
# array_tag = ["#yolo","#tmtc","#lifeisbeautiful","#felicita","#xoxoxo","#lavielapute","#holyshit","#thp","#bonjour_monde","#cocobongo","#saladestomatesoignons","#politequementincorrect","#ACAB"]
# city = City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 5))
# users = User.create(first_name: Faker::Creature::Dog.name, last_name: Faker::Games::Pokemon.name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.within(range: 15..35), city: City.all.sample)
# tag = Tag.create(title: array_tag.sample)
# end

# 20.times do
#   gossip = Gossip.create(title: Faker::App.name , content: Faker::ChuckNorris.fact, user: User.all.sample)
#   lien = Link.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
# end

# 10.times do
#  pm = PrivateMessage.create(content: Faker::Movies::BackToTheFuture.quote, sender: User.all.sample, recipient: User.all.sample)
# end
1.times do
@city = City.create(name: "Paris", zip_code: "75000")
User.create(first_name: "Anonymous", last_name: "Smith", description: "I am anonymous like a anonyme anonymous", email: "johndoe@gmail.com", age: 99, city: @city, password: "foo")
end
puts "==================
DATA BASE CREATED
=================="