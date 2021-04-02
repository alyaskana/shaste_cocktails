json.extract! @user, :id, :login, :user_name, :avatar, :created_at, :updated_at
json.ingredients @user.ingredients, :id, :name