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
  has_many :ingredients, :through => :user_ingredients

  has_many :favorites, dependent: :destroy
  has_many :favorited_cocktails, :through => :favorites, :source => :cocktail
end
