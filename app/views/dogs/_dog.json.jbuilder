json.extract! dog, :id, :name, :age, :price, :description, :created_at, :updated_at
json.url dog_url(dog, format: :json)
