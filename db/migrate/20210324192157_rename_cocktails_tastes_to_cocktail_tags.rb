class RenameCocktailsTastesToCocktailTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :cocktails_tastes, :taste_id, :tag_id
    rename_table :cocktails_tastes, :cocktails_tags
  end
end
