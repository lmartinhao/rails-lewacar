# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

@users = []

puts 'Cleaning database'
User.destroy_all

puts 'Creating users'

30.times do
  file = URI.open("https://source.unsplash.com/featured/?profile")
  @user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: rand(18..40),
    password: "123123"
  )
  @user.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
  @user.save
  @users << @user
  puts "user with id: #{@user.id} has been created"
end

puts 'Creating master user'

100.times do
  ride = Ride.create(
    user: @users.sample,
    route: "#{Faker::Address.street_name} até #{Faker::Address.street_name}",
    date: Faker::Date.forward(days: 7),
    price: rand(10..100),
    pickup_address: Faker::Address.street_name,
    time: Faker::Time.forward(days: 7, period: %i[evening morning].sample, format: :short),
    passengers: rand(1..4)
  )
  puts "Ride with id: #{ride.id} has been created"
end
