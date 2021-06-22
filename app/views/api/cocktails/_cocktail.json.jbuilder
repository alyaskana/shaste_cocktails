json.extract! cocktail, :id, :user_id, :title, :image, :description, :directions, :youtube, :created_at, :updated_at
json.user do 
  json.extract! cocktail.user, :id, :login, :user_name
end
json.ingredients cocktail.cocktails_ingredients do |ci|
  json.name ci.ingredient.name
  json.id ci.ingredient.id
  json.amount ci.amount
end

json.tags cocktail.tags.group(:name).count
json.tasted_users cocktail.tasted_users.count
json.favorited_users cocktail.favorited_users.count
json.liked_users cocktail.liked_users.count

if defined?(similar_cocktails)
  json.similar_cocktails do 
    json.array! similar_cocktails, partial: "api/cocktails/cocktail", as: :cocktail
  end
end