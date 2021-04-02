class AddYoutubeToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :youtube, :string
  end
end
