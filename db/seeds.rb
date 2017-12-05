# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating DateBase"

5.times do
  titre = Faker::FamilyGuy.location
  description = Faker::ChuckNorris.fact
  tresor = Tresor.new(user: User.all.sample, titre: titre, title: titre, description: description)
  tresor.save!
end
