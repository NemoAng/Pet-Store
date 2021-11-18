class AddImageLinkToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :image_link, :string
  end
end
