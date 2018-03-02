# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Pet.destroy_all

user = User.first
puts(user.id)

20.times do |index|
  Pet.new(user: user, name: Faker::Cat.name, animal_type: Faker::Cat.breed, photo: "image/upload/v1519892210/uf18laf5zb3zf5trjxoz.jpg").save
  puts "created a pet!"
end


puts('Created 20 pets!')
