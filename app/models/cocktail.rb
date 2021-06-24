class Cocktail < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

	validates :title, :presence => true,
                    :length => { :minimum => 3 }

  has_many :cocktails_ingredients, dependent: :destroy
  has_many :ingredients, :through => :cocktails_ingredients

  has_many :cocktails_tags, dependent: :destroy
  has_many :tags, :through => :cocktails_tags

  has_many :posts_cocktails, dependent: :destroy
  has_many :posts, :through => :posts_cocktails

  has_many :favorited_cocktails, dependent: :destroy
  has_many :favorited_users, :through => :favorited_cocktails, :source => :user

  has_many :tasted_cocktails, dependent: :destroy
  has_many :tasted_users, :through => :tasted_cocktails, :source => :user

  has_many :cocktails_likes, dependent: :destroy
  has_many :liked_users, :through => :cocktails_likes, :source => :user
  
  has_many :posts
end
