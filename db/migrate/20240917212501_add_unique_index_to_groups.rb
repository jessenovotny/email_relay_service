class AddUniqueIndexToGroups < ActiveRecord::Migration[7.2]
  def change
    add_index :groups, :email, unique: true
    add_index :groups, :name, unique: true
    add_index :users, :email, unique: true
  end
end
