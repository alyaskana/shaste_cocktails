json.ingredients do 
  json.array! ingredients, partial: "api/ingredients/ingredient", as: :ingredient
end