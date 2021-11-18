class RemoveStatusFromCats < ActiveRecord::Migration[6.1]
  def change
    remove_column :cats, :status, :string
  end
end
