class PostsCocktail < ApplicationRecord
  belongs_to :post
  belongs_to :cocktail
end
