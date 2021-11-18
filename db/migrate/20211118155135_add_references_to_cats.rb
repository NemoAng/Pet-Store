class AddReferencesToCats < ActiveRecord::Migration[6.1]
  def change
    add_reference :cats, :cat_breed, null: false, foreign_key: true
  end
end
