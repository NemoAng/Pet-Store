class AddImageLinkToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :image_link, :string
  end
end
