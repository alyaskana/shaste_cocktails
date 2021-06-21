json.extract! user, :id, :login, :user_name, :avatar, :description, :link, :created_at, :updated_at
json.ingredients user.ingredients, :id, :name
json.followers user.followers, :id
json.followings user.followings, :id
json.cocktails user.cocktails, :id
json.tasted user.tasted, :id
json.favorites user.favorites, :id
json.likes user.likes, :id