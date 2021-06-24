class AddCocktailIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :cocktail, null: false, foreign_key: true
  end
end
