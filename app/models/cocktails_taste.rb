class CocktailsTaste < ApplicationRecord
  belongs_to :cocktail
  belongs_to :taste
end
