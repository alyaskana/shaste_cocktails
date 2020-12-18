class User < ApplicationRecord
  validates :login, :presence => true
  validates :first_name, :presence => true
end
