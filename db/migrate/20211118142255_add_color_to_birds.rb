class AddColorToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :color, :string
  end
end
