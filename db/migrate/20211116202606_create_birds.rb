class CreateBirds < ActiveRecord::Migration[6.1]
  def change
    create_table :birds do |t|
      t.string :name
      t.integer :age
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
