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
    cocktails_ingredients = cocktail_params[:ingredients].map { |i| CocktailsIngredient.new({ingredient_id: i[:id], amount: i[:amount]}) }

    @cocktail = current_user.cocktails.new({
      title: cocktail_params[:title],
      description: cocktail_params[:description],
      directions: cocktail_params[:steps],
      youtube: cocktail_params[:youtube],
      tags: tags,
      cocktails_ingredients: cocktails_ingredients,
      image: cocktail_params[:photo],
    })

    unless @cocktail.save
      render json: { errors: @cocktail.errors, status: :unprocessable_entity }
    end
  end


  def like
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.likes << cocktail
    current_user.save!
    head :no_content
  end

  def unlike
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.likes.delete(cocktail)
    current_user.save!
    head :no_content
  end


  private 

  def cocktail_params
    params.require(:cocktail).permit(:title, :description, :youtube, :photo, tags: [], ingredients: [:id, :amount], steps: [])

    # new_params = params.require(:cocktail).permit(:title, :image, :description, :youtube, directions: [], cocktails_ingredients: [:ingredient_id, :amount], tags: [])

    # cocktails_ingredients = new_params[:cocktails_ingredients].map { |ci| CocktailsIngredient.new(ci) }
    # new_params[:cocktails_ingredients] = cocktails_ingredients

    # tags = Tag.where(id: new_params[:tags])
    # new_params[:tags] = tags
    
    # new_params
  end
end
