# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating DateBase"

TypeAbordage.destroy_all

[["Euros", "euros"], ["Drinks", "drinks"], ["Troc", "troc"], ["Free Hug", "free-hug"]].each do |type|
  TypeAbordage.create(nom: type[0], emoji: type[1])
end

puts "Seed finished"
