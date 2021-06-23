class Api::CocktailsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    cocktails = Cocktail.all
    render :index, locals: {cocktails: cocktails}
  end

  def show
    cocktail = Cocktail.includes(:ingredients).find(params[:id])
    ingredients_ids = cocktail.ingredients.pluck(:id)
    similar_cocktails_ids = Cocktail
      .joins(:cocktails_ingredients)
      .where("cocktails_ingredients.ingredient_id" => ingredients_ids)
      .where.not('cocktails_ingredients.cocktail_id' => cocktail.id).group(:id)
      .count.sort_by {|key, value| -value}.first(4).to_h.keys

    similar_cocktails = Cocktail.includes(:ingredients).find(similar_cocktails_ids)
    render :show, locals: {cocktail: cocktail, similar_cocktails: similar_cocktails}
  end

  def create
    tags = Tag.where(id: cocktail_params[:tags])
    cocktails_ingredients = cocktail_params[:ingredients].map { |i| CocktailsIngredient.new({ingredient_id: i[:id], amount: i[:amount]}) }

    cocktail = current_user.cocktails.new({
      title: cocktail_params[:title],
      description: cocktail_params[:description],
      directions: cocktail_params[:steps],
      youtube: cocktail_params[:youtube],
      tags: tags,
      cocktails_ingredients: cocktails_ingredients,
      image: cocktail_params[:photo],
    })

    unless cocktail.save
      render json: { errors: cocktail.errors, status: :unprocessable_entity }
    end

    render :create, locals: {cocktail: cocktail}
  end


  def like
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.likes << cocktail
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
  end

  def unlike
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.likes.delete(cocktail)
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
  end

  def favorite
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.favorites << cocktail
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
  end

  def unfavorite
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.favorites.delete(cocktail)
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
  end

  def taste
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.tasted << cocktail
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
  end

  def untaste
    cocktail = Cocktail.find_by(id: params[:id])
    unless cocktail
      return render json: {error: "Cocktail with id=#{params[:id]} not found"}, status: 404
    end

    current_user.tasted.delete(cocktail)
    current_user.save!
    render :show, locals: {cocktail: cocktail, similar_cocktails: []}
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
