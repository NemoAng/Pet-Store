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

CAT_NUM = (1..20).freeze
DOG_NUM = (1..30).freeze
BIRD_NUM = (1..40).freeze

cat_api_url = "https://thatcopy.pw/catapi/rest/"
dog_api_url = "https://dog.ceo/api/breeds/image/random"
# bird_api_url =~ ""

def cat_api_fetch(url)
  cat_html = URI.open(url).read
  JSON.parse(cat_html)
end

def dog_api_fetch(url)
  dog_html = URI.open(url).read
  JSON.parse(dog_html)
end

# def bird_api_fetch(url)
#   bird_html =~ URI.open(url).read
#   JSON.parse(bird_html)
# end

# unless (false)
#   # run if condition is false
# end

# 1_000_001.even? run again
# 1_000_000.even? run ignore
unless 1_000_000.even?
  Cat.delete_all
  CatBreed.delete_all

  CAT_NUM.each_with_index do |item, index|
    name = Faker::Creature::Cat.unique.name
    age = rand(1..5)
    price = Faker::Number.decimal(l_digits: 2, r_digits: 2)
    description = Faker::Lorem.paragraph(sentence_count: rand(5..10), supplemental: false,
                                         random_sentences_to_add: 4)
    image_link = cat_api_fetch(cat_api_url)["url"]

    breed = Faker::Creature::Cat.breed
    breed_description = Faker::Lorem.paragraph(sentence_count: rand(5..10), supplemental: false,
                                               random_sentences_to_add: 4)

    puts "What??: #{item}"
    puts "Creating cat breed: #{breed}"
    cat_breed = CatBreed.find_or_create_by(name: breed) # Breed, 1
    cat_breed.description = breed_description
    cat_breed.save

    # if cat_breed && cat_breed.valid?
    # next unless cat_breed && cat_breed.valid?
    cat_breed&.valid?

    puts "Creating #{index}/#{CAT_NUM.max} cat: #{name}"

    cat_breed.cats.create( # Cat,,,[Breed/has_many :cats], 2
      name:        name,
      age:         age,
      price:       price,
      image_link:  image_link,
      description: description
    )
  end
end

# 1_000_001.even? run again
# 1_000_000.even? run ignore
unless 1_000_000.even?
  Dog.delete_all
  DogBreed.delete_all

  DOG_NUM.each_with_index do |item, index|
    name = Faker::Creature::Dog.unique.name
    age = rand(1..5)
    price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
    description = Faker::Lorem.paragraph(sentence_count: rand(5..10), supplemental: false,
                                         random_sentences_to_add: 4)
    image_link = dog_api_fetch(dog_api_url)["message"]

    breed = Faker::Creature::Dog.breed
    breed_description = Faker::Lorem.paragraph(sentence_count: rand(5..10), supplemental: false,
                                               random_sentences_to_add: 4)

    puts "What??: #{item}"
    puts "Creating dog breed: #{breed}"
    dog_breed = DogBreed.find_or_create_by(name: breed) # Breed, 1
    dog_breed.description = breed_description
    dog_breed.save

    # if cat_breed && cat_breed.valid?
    # next unless cat_breed && cat_breed.valid?
    dog_breed&.valid?

    puts "Creating #{index}/#{DOG_NUM.max} dog: #{name}"

    dog_breed.dogs.create( # Cat,,,[Breed/has_many :cats], 2
      name:        name,
      age:         age,
      price:       price,
      image_link:  image_link,
      description: description
    )
  end
end

unless 1_000_001.even?
  Bird.delete_all
  # BirdBreed.delete_all

  bird = BIRD_NUM.each do |index|
    name = Faker::Creature::Bird.unique.common_name
    age = rand(1..5)
    price = Faker::Number.decimal(l_digits: 1, r_digits: 2)
    description = Faker::Lorem.paragraph(sentence_count: rand(5..10), supplemental: false,
                                         random_sentences_to_add: 4)
    # image_link = nil # bird_api_fetch(bird_api_url)["message"]
    common_family_name = Faker::Creature::Bird.common_family_name
    geo = Faker::Creature::Bird.geo
    adjective = Faker::Creature::Bird.adjective
    emotional_adjective = Faker::Creature::Bird.emotional_adjective
    silly_adjective = Faker::Creature::Bird.silly_adjective
    color = Faker::Creature::Bird.color

    puts "Creating #{index}/#{BIRD_NUM.max} bird: #{name}"

    bird = Bird.create(
      name:                name,                age:                 age,
      price:               price,               image_link:          "image_link",
      description:         description,         common_family_name:  common_family_name,
      geo:                 geo,                 adjective:           adjective,
      emotional_adjective: emotional_adjective, silly_adjective:     silly_adjective,
      color:               color
    )
    if bird.save
      puts "bird was saved to the database products table."
      # pp bird
    else
      puts "There was an error saving bird to the database."
    end
  end
end

puts "Created #{CatBreed.count} cat breeds"
puts "Created #{Cat.count} cats\n"

puts "Created #{DogBreed.count} dog breeds"
puts "Created #{Dog.count} dogs\n"

puts "Created #{Bird.count} birds"
