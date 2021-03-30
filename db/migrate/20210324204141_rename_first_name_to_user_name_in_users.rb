class RenameFirstNameToUserNameInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_name, :user_name
    remove_column :users, :last_name, :string
  end
end
