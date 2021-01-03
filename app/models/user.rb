class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :login, :presence => true, uniqueness: true
  validates :first_name, :presence => true
  validates :email, uniqueness: true

  has_many :cocktails, dependent: :destroy
end
