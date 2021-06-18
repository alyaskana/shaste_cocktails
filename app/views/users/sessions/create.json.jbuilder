json.extract! @user, :id, :login, :user_name, :avatar, :created_at, :updated_at
json.ingredients @user.ingredients, :id, :name
json.followers @user.followers, :id, :login, :user_name, :avatar
json.followings @user.followings, :id, :login, :user_name, :avatar