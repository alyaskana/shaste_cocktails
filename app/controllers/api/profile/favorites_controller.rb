class Api::Profile::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    cocktails = current_user.favorited_cocktails
    render :index, locals: {cocktails: cocktails}
  end


  def create
    cocktail = Cocktail.find_by(id: params[:id])

    unless cocktail
      return render json: {error: "Cocktail not found"}
    end

    current_user.favorited_cocktails = (current_user.favorited_cocktails + [cocktail]).uniq
    
    cocktails = current_user.favorited_cocktails
    render :index, locals: {cocktails: cocktails}
  end

  def destroy
    cocktail = Cocktail.find_by(id: params[:id])

    unless cocktail
      return render json: {error: "Cocktail not found"}
    end

    current_user.favorited_cocktails = (current_user.favorited_cocktails - [cocktail]).uniq

    cocktails = current_user.favorited_cocktails
    render :index, locals: {cocktails: cocktails}
  end
end
