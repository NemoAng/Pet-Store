class DropBirdBreeds < ActiveRecord::Migration[6.1]
  def change
    drop_table :bird_breeds, if_exist: true
  end
end
