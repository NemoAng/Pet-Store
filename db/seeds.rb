# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "nokogiri"
require "open-uri"
require "json"

CAT_NUM = 1..20
DOG_NUM = 1..30
BIRD_NUM = 1..40

Cat.delete_all
Dog.delete_all
Bird.delete_all


# # Random cat name
# Faker::Creature::Cat.name #=> "Shadow"

# # Random cat breed
# Faker::Creature::Cat.breed #=> "British Semipi-longhair"

# # Random cat registry
# Faker::Creature::Cat.registry #=> "American Cat Fanciers Association"


puts "Created #{Cat.count} cats"
puts "Created #{Dog.count} breeds"
puts "Created #{Bird.count} countries"

