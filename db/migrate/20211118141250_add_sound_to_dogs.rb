class AddSoundToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :sound, :string
  end
end
