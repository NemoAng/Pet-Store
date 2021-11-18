class CatBreed < ApplicationRecord
  # paginates_per 30

  # for dog's FK
  # , foreign_key: "cat_breed_id"
  has_many :cats

  # for validate.
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  # for many-to-many association
  # has_many :breed_countries
  # has_many :countries, through: :breed_countries
end
