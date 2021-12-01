class Bird < ApplicationRecord
  # paginates_per 30

  # for own's FK
  belongs_to :category

  # for validate.
  validates :name, :age, :price, :description, :image_link, presence: true

  # for many-to-many association
  # has_many :cat_countries
  # has_many :countries, through: :cat_countries
end
