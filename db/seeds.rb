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
descriptions = [
  "As I step off the spacecraft onto the alien soil, a sense of exhilaration fills me—the thrill of being on a planet not found in any tourist brochure. The vibrant hues of the sky, unfamiliar constellations, and the crisp, otherworldly air make this holiday destination truly out of this world. It's not just a vacation; it's a cosmic adventure.",
  "My holiday is a journey beyond the stars, with each day bringing new wonders to behold. From the mesmerizing glow of the alien sunsets to the surreal landscapes that stretch beyond the horizon, every moment is a postcard-worthy scene. This is not just a getaway; it's a celestial escape into the unknown.",
  "Leave behind the ordinary and embrace the extraordinary! On this planetary holiday, I'm trading sandy beaches for crystalline alien lakes and city lights for the dazzling glow of phosphorescent flora. It's a vacation that defies the conventions of Earthly getaways, offering a taste of the sublime in the vastness of the cosmos.",
  "Nestled under the alien skies, my holiday unfolds as a celestial symphony. I lounge on the surface, gazing up at constellations never before seen, as the alien atmosphere paints the night with hues unseen on Earth. This isn't just a vacation; it's an astronomical rendezvous with the cosmos.",
  "From the bustling metropolises of Earth to the serene solitude of an alien planet—the change is both refreshing and surreal. My holiday here is an exploration of the unknown, where the rhythm of life is dictated by the alien landscapes and the mysterious allure of a planet waiting to be discovered. It's not just a vacation; it's a cosmic odyssey."
]

puts "destroying all users..."
User.destroy_all
puts "users destroyed"

puts "destroying all land"
Land.destroy_all
puts "land destroyed"

IMAGES = ['https://images.unsplash.com/photo-1532795077981-fc1c26555bd4?q=80&w=3020&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
'https://images.unsplash.com/photo-1614313913007-2b4ae8ce32d6?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
 'https://images.unsplash.com/photo-1545156521-77bd85671d30?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
 'https://images.unsplash.com/photo-1632395627727-3b97d0724814?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
 'https://images.unsplash.com/photo-1632395627732-005012dbc286?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']

10.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i}@email.com",
    species: 'martian',
    password: '123456'
  )
  user.save!
  puts "created user #{user.first_name} #{user.last_name}"
  rand(1..3).times do
    land = Land.new(
      area: rand(50..300),
      user_id: user.id,
      address: "#{Faker::Address.street_address}",
      local_attractions: local_attractions.sample,
      images: IMAGES.shuffle,
      price: rand(50..150),
      description: descriptions.sample,
      planet_name: Faker::Space.planet
    )
    land.save!
    puts "created land - #{land.address}"
  end
end
