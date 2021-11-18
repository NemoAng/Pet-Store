class AddGeoToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :geo, :string
  end
end
