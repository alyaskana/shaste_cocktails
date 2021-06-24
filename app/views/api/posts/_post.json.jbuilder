json.extract! post, :id, :content, :image, :parent_id

json.user do 
  json.partial! "api/users/user", user: post.user
end