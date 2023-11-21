# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# create 10 users with random names
#using the same password
#email addresses test1 increment
require 'faker'
# Planet.create(name: Faker::Space.planet)
# User.new (first_name, last_name, email,(species human or martian), password:"123456")
local_attractions = %w[habedashery rock-throwing rock-climbing rock'n'roll rollercoasters food]

puts "destroying all users..."
User.destroy_all
puts "users destroyed"

puts "destroying all land"
Land.destroy_all
puts "land destroyed"



10.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i}@email.com",
    species: ['human', 'martian'].sample, # Randomly choose 'human' or 'martian'
    password: '123456'
  )
  user.save!
  puts "created user #{user.first_name} #{user.last_name}"
  rand(1..8).times do
    land = Land.new(
      area: rand(50..300),
      user_id: user.id,
      address: "#{Faker::Address.street_address}, #{Faker::Space.planet}",
      local_attractions: local_attractions.sample
    )
    land.save!
    puts "created land - #{land.address}"
  end
end
