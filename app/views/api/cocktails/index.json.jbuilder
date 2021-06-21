json.cocktails do 
  json.array! cocktails, partial: "api/cocktails/cocktail", as: :cocktail
end