class RenameFavoritesTableToFavoritedCocktailsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :favorites, :favorited_cocktails
  end
end
