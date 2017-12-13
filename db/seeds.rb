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
CrewPirate.destroy_all
procesing('CrewPirate')
Pirate.destroy_all
procesing('Pirate')
Tresor.destroy_all
procesing('Tresor')
Crew.destroy_all
procesing('Crew')
Abordage.destroy_all
procesing('Abordage')
TypeAbordage.destroy_all
procesing('TypeAbordage')

puts "DB destroyed"
puts "Creating DateBase"


# #------------ CREATION DES TYPES D'ABORDAGES #-->
[["euro", "euros"], ["drink", "drinks"], ["cado", "troc"], ["free hug", "free"]].each do |type|
  TypeAbordage.create(nom: type[0], emoji: type[1])
end

#------------ CREATION DES CREWS #-->

url = "http://les-departements.fr/carte-des-regions.html"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.liste-region ul li span').first(10).each do |element|
  crew = Crew.create(nom: element.text.strip, prive: false)
  crew
end

5.times do |c|
 crews = Faker::HarryPotter.house
  crew = Crew.create(nom: crews, prive: true, password: 456789)
end

5.times do |c|
 crews = Faker::GameOfThrones.house
  crew = Crew.create(nom: crews, prive: true, password: 456789)
end

def tocrew(arg)
  crew = Crew.create(nom: arg, prive: true, password: 456789)
end

tocrew("Le Wagon Paris")
tocrew("La Sorbonne")
tocrew("IUT Paris Descartes")
tocrew("BDE Dauphine")
tocrew("Paris")
#------------ CREATION DE PIRATES #-->

10.times do |m|
   pseudo = "#{Faker::HarryPotter.character.split[0]}#{Faker::Superhero.prefix}"
   email =  "#{pseudo}@mail.com"
   pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

10.times do |m|
  pseudo = "#{Faker::StarWars.character.split[0]}#{Faker::Superhero.prefix}"
  email =  "#{pseudo}@mail.com"
  pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

10.times do |m|
   pseudo = "#{Faker::GameOfThrones.character.split[0]}#{Faker::GameOfThrones.house.split[0]}"
   email =  "#{pseudo}@#{Faker::GameOfThrones.house.split[0]}.com"
  pirate = Pirate.create!(pseudo: pseudo, email: email, password: '123456')
end

def pirate_creation(arg)
  Pirate.create!(pseudo: "#{arg}", email: "#{arg}@mail.com", password: '123456')

end

pirate_creation("Blondy")
pirate_creation("Côme")
pirate_creation("Capu")
pirate_creation("Gaby")
pirate_creation("Boris")

#------------ CREATION DE CREWS/PIRATES #-->

125.times do |l|
  crew = Crew.all.sample
  pirate = Pirate.all.sample
  crewpirate = CrewPirate.new(pirate_id: pirate.id, crew_id: crew.id)
  if crewpirate.save
    procesing(crewpirate)
    else
  end
end



procesing('INSTALATION')




