json.extract! user, :id, :login, :first_name, :last_name, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)
