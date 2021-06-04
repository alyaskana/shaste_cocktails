class Api::CocktailsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    tags = Tag.where(id: cocktail_params[:tags])

    @cocktail = current_user.cocktails.new({
      title: cocktail_params[:title],
      directions: cocktail_params[:steps],
      youtube: cocktail_params[:youtube],
      tags: tags
    })

    unless @cocktail.save
      rendoe json: { errors: @cocktail.errors, status: :unprocessable_entity }
    end
  end


  private 

  def cocktail_params
    params.require(:cocktail).permit(:title, :youtube, :photo, tags: [], ingredients: [:name, :count], steps: [])

    # new_params = params.require(:cocktail).permit(:title, :image, :description, :youtube, directions: [], cocktails_ingredients: [:ingredient_id, :amount], tags: [])

    # cocktails_ingredients = new_params[:cocktails_ingredients].map { |ci| CocktailsIngredient.new(ci) }
    # new_params[:cocktails_ingredients] = cocktails_ingredients

    # tags = Tag.where(id: new_params[:tags])
    # new_params[:tags] = tags
    
    # new_params
  end
end
