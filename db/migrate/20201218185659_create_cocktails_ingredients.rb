class CreateCocktailsIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails_ingredients do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
