class RenameWantToTryCocktailToCocktailsLikes < ActiveRecord::Migration[6.0]
  def change
    rename_table :want_to_try_cocktails, :cocktails_likes
  end
end
