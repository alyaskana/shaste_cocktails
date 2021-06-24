class Post < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  has_one :parent, class_name: "Post"

  mount_uploader :image, ImageUploader
end
