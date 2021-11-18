class AddEmotionalAdjectiveToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :emotional_adjective, :string
  end
end
