module CocktailsHelper
  def cocktail_ingredients(cocktail)
    cocktail.ingredients.pluck(:name).join(', ')
  end
end
