json.extract! cocktail, :id, :user_id, :title, :image, :description, :directions, :created_at, :updated_at
  json.user do 
    json.extract! cocktail.user, :id, :login
  end
  json.ingredients cocktail.ingredients, :name