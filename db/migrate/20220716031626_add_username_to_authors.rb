class AddUsernameToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :username, :string
    add_index :authors, :username,  unique: true
  end
end
