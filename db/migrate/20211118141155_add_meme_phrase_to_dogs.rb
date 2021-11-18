class AddMemePhraseToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :meme_phrase, :string
  end
end
