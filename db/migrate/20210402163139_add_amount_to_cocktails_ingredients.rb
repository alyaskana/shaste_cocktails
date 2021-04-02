class AddAmountToCocktailsIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails_ingredients, :amount, :string
  end
end
