class Post < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: “Post”

  has_many :posts_cocktails
  has_many :cocktails, :through => :posts_cocktails
end
