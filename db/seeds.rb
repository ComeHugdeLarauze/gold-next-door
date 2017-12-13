require 'faker'
require 'open-uri'
require 'nokogiri'

def procesing(arg)
  puts "#{arg} destruction in progresse."
  puts "#{arg} destruction in progresse.."
  puts "#{arg} destruction in progresse..."
  puts "#{arg} has been destroy succesfuly"
end



puts "Destroy all DB."
TypeAbordage.destroy_all
procesing('TypeAbordage')
CrewPirate.destroy_all
procesing('CrewPirate')
Pirate.destroy_all
procesing('Pirate')
Crew.destroy_all
procesing('Crew')

puts "DB destroyed"
puts "Creating DateBase"


#------------ CREATION DES TYPES D'ABORDAGES #-->
[["euro", "euros"], ["drink", "drinks"], ["cado", "troc"], ["free hug", "free"]].each do |type|
  TypeAbordage.create(nom: type[0], emoji: type[1])
end

#------------ CREATION DES CREWS #-->

url = "http://les-departements.fr/carte-des-regions.html"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.liste-region ul li span').each do |element|
  crew = Crew.create(nom: element.text.strip, prive: false)
  p crew
end

5.times do |c|
 crews = Faker::HarryPotter.house
  crew = Crew.create(nom: crews, prive: true, password: 456789)
end

5.times do |c|
 crews = Faker::GameOfThrones.house
  crew = Crew.create(nom: crews, prive: true, password: 456789)
end


crews = "LeWagon"
crew = Crew.create(nom: crews, prive: true, password: 456789)

crews = "LaSorbonne"
crew = Crew.create(nom: crews, prive: true, password: 456789)

crews = "ParisDESCARTE"
crew = Crew.create(nom: crews, prive: true, password: 456789)

crews = "EMLV"
crew = Crew.create(nom: crews, prive: true, password: 456789)


#------------ CREATION DE PIRATES #-->

10.times do |m|
   p pseudo = "#{Faker::HarryPotter.character.split[0]}#{Faker::Superhero.prefix}"
   p email =  "#{pseudo}@mail.com"
   pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

10.times do |m|
  p pseudo = "#{Faker::StarWars.character.split[0]}#{Faker::Superhero.prefix}"
  p email =  "#{pseudo}@mail.com"
  pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

10.times do |m|
   p pseudo = "#{Faker::GameOfThrones.character.split[0]}#{Faker::GameOfThrones.house.split[0]}"
   p email =  "#{pseudo}@#{Faker::GameOfThrones.house.split[0]}.com"
  pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

Pirate.create!(pseudo: "Max", email: "maxime@mail.com", password: '123456')
Pirate.create!(pseudo: "Come", email: "come@mail.com", password: '123456')
Pirate.create!(pseudo: "Capu", email: "capucine@mail.com", password: '123456')
Pirate.create!(pseudo: "Gaby", email: "gabriel@mail.com", password: '123456')

#------------ CREATION DE CREWS/PIRATES #-->

95.times do |l|
  crew = Crew.all.sample
  pirate = Pirate.all.sample
  crewpirate = CrewPirate.new(pirate_id: pirate.id, crew_id: crew.id)
  if crewpirate.save
    procesing(crewpirate)
    else
  end
end



procesing('INSTALATION')




