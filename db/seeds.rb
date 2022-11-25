# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

@users = []

@rides = []

@routes = [
  "Cristo Redentor",
  "Parque Lage, Jardim Botânico",
  "Pão de Açucar, Urca",
  "Praia de Copacabana",
  "Arcos da Lapa, Rio de Janeiro",
  "Pedra da Gávea",
  "Estádio do Maracanã",
  "Elevador Lacerda",
  "Cataratas do Iguaçu",
  "Chapada dos Veadeiros",
  "Aeroporto Internacional de Guarulhos",
  "Aeroporto de Congonhas",
  "Aeroporto de Viracopos",
  "Aeroporto Internacional Galeão",
  "Parque Ibirapuera",
  "MASP",
  "Museu do Amanhã, Rio de Janeiro",
  "Beach Park, Fortaleza",
  "Jardim Botânico de Curitiba",
  "Praia de Santos",
  "Estádio do Morumbi",
  "Praia de Jericoacoara",
  "Búzios",
  "Arraial do Cabo"
]

@address = [
  "Avenida Paulista, 1000, São Paulo",
  "Alameda Yayá, 310, Guarulhos",
  "Rua Bartira, 1350, São Paulo",
  "Rua Gustavo Sampaio, 676, Rio de Janeiro",
  "Avenida Nossa Senhora de Copacabana, 335, Rio de Janeiro",
  "Avenida das Nações Unidas, 14401, São Paulo",
  "Rua General Goes Monteiro, 8, Rio de Janeiro",
  "Rua das Figueiras, 64, Cajamar",
  "Rua Djalma Dutra, 701, Botucatu",
  "Rua Pedro Alexandre, 26, Guarulhos",
  "Avenida Atlântica, 100, São Bernardo do Campo",
  "Rua Augusta, 300, São Paulo",
  "Avenida Governador Agamenon Magalhães, 10, Recife",
  "Avenida Luíz Eduardo magalhães, 500, Salvador",
  "Avenida Paulo Faccini, 150, Guarulhos"
]

@status = [true, false]

puts 'Cleaning database'
User.destroy_all

puts 'Creating users'

20.times do
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

puts 'Creating rides'

20.times do
  @ride = Ride.create(
    user: @users.sample,
    route: @routes.sample,
    date: Faker::Date.forward(days: 7),
    price: rand(10..100),
    pickup_address: @address.sample,
    ride_time: Faker::Time.forward(days: 7, period: %i[evening morning].sample, format: :short),
    passengers: rand(1..4)
  )
  @rides << @ride
  puts "Ride with id: #{@ride.id} has been created"
end

puts 'Creating some matches'

10.times do
  match = Match.create(
    user: @users.sample,
    ride: @rides.sample,
    finished: @status.sample
  )
  puts "Match with id: #{match.id} has been created"
end
