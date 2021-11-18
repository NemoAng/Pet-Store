class AddCoatLengthToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :coat_length, :string
  end
end
