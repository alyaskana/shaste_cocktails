json.extract! cocktail, :id, :user_id, :title, :image, :description, :directions, :created_at, :updated_at
json.user do 
  json.extract! cocktail.user, :id, :login, :user_name
end
json.ingredients cocktail.ingredients, :name
json.tags cocktail.tags.group(:name).count
json.tasted_users cocktail.tasted_users.count
json.favorited_users cocktail.favorited_users.count
json.liked_users cocktail.liked_users.count