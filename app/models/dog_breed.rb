class DogBreed < ApplicationRecord
  # paginates_per 30

  # for dog's FK
  has_many :dogs

  # for validate.
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  # for many-to-many association
  # has_many :breed_countries
  # has_many :countries, through: :breed_countries
end
