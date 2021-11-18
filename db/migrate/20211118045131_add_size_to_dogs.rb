class AddSizeToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :size, :string
  end
end
