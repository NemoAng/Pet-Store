class AddReferencesToDogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :dogs, :dog_breed, null: false, foreign_key: true
  end
end
