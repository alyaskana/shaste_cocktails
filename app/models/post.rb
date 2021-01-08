class Post < ApplicationRecord
  belongs_to :user
  has_one :parent, class_name: "Post"

  mount_uploader :image, ImageUploader

  has_many :posts_cocktails, dependent: :destroy
  has_many :cocktails, :through => :posts_cocktails
end
