class Post < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: “Post”
end
