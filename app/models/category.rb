class Category < ApplicationRecord
  # for cat's FK
  has_many :cats, :dogs, :birds

  # for validate.
  validates :species, :species_name, presence: true
  validates :species, :species_name, uniqueness: true
end
