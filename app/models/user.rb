class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
          
  self.skip_session_storage = [:http_auth, :params_auth]
  validates :login, :presence => true, uniqueness: true
  validates :email, uniqueness: true


  mount_uploader :avatar, ImageUploader

  has_many :cocktails, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :user_ingredients, dependent: :destroy
  has_many :ingredients, -> { order 'user_ingredients.created_at' }, :through => :user_ingredients

  has_many :favorites, dependent: :destroy
  has_many :favorited_cocktails, :through => :favorites, :source => :cocktail

  has_many :received_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :given_follows, foreign_key: :following_id, class_name: "Follow"

  has_many :followers, :through => :received_follows, :source => :following
  has_many :followings, :through => :given_follows, :source => :follower

  has_many :tasted_cocktails, dependent: :destroy
  has_many :tasted, :through => :tasted_cocktails, :source => :cocktail
end
