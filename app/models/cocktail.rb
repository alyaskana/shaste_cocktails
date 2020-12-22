class Cocktail < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ::ImageUploader

	validates :title, :presence => true,
                    :length => { :minimum => 3 }
  validates :directions, :presence => true

  has_many :cocktails_ingredients
  has_many :ingredients, :through => :cocktails_ingredients

  has_many :cocktails_tastes
  has_many :tastes, :through => :cocktails_tastes

  has_many :posts_cocktails
  has_many :posts, :through => :posts_cocktails

  has_many :favorites
  has_many :favorited_users, :through => :favorites

  has_many :tasted_cocktails
  has_many :tasted_users, :through => :tasted_cocktails

  has_many :want_to_try_cocktails
  has_many :wanted_to_try_users, :through => :want_to_try_cocktails
end
