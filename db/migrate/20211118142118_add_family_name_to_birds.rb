class AddFamilyNameToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :common_family_name, :string
  end
end
