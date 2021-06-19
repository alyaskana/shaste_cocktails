class AddDescriptionAndLinkFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text
    add_column :users, :link, :string
  end
end