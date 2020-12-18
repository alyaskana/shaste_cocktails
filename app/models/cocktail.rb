class Cocktail < ApplicationRecord
  belongs_to :user

	validates :title, :presence => true,
                    :length => { :minimum => 3 }
  validates :directions, :presence => true
end
