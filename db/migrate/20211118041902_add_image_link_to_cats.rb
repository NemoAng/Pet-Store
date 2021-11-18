class AddImageLinkToCats < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :image_link, :string
  end
end
