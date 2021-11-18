class AddSillyAdjectiveToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :silly_adjective, :string
  end
end
