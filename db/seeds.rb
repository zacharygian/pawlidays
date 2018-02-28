# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.first
puts(user.id)

20.times do |index|
  Pet.create!(user: user, name: Faker::Cat.name, animal_type: Faker::Cat.breed)
end


puts('Created 20 pets!')
