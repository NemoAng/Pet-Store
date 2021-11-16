class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
