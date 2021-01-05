module CocktailsHelper
  def cocktail_ingredients(cocktail)
    cocktail.ingredients.map {|i| i.name}.join(', ')
  end
end
