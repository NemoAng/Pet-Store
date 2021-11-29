class AddCategoryToDogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :dogs, :category, null: true, foreign_key: true
  end
end
