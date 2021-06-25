json.extract! post, :id, :content, :image, :parent_id

json.user do 
  json.id post.user.id
  json.login post.user.login
  json.avatar post.user.avatar.url(:thumb)
  json.user_name post.user.user_name
end

json.cocktail do 
  json.extract! post.cocktail, :id, :user_id, :title, :image, :description, :directions, :youtube, :created_at, :updated_at
end