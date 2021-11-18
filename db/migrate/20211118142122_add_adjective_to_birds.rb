class AddAdjectiveToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :adjective, :string
  end
end
