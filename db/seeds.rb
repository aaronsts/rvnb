# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

#clear database
puts "clearing database"
Listing.destroy_all
User.destroy_all


puts "creating users"
iliana = User.create!(email: "iliana@gmail.com", password: "123456", first_name: "Iliana", last_name: "Loureiro")
aaron = User.create!(email: "aaron@gmail.com", password: "123456", first_name: "Aaron", last_name: "Staes")
mert = User.create!(email: "mert@gmail.com", password: "123456", first_name: "Mert", last_name: "Arslan")
hamza = User.create!(email: "hamza@gmail.com", password: "123456", first_name: "Hamza", last_name: "El Kholy")

users = [iliana, aaron, mert, hamza]

puts "create listings"

20.times do
  Listing.create!(
    vehicle_name: Faker::FunnyName.name,
    description: Faker::Lorem.paragraph,
    price: rand(50..100),
    capacity: rand(1..5),
    user: users.sample)
end
