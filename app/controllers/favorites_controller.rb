class FavoritesController < ApplicationController
  before_action :find_cocktail
  before_action :find_favorite, only: [:destroy]

  def create
    if already_favorited?
      flash[:notice] = "You can't favorite more than once"
    else
      @cocktail.favorites.create(user_id: current_user.id)
    end
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    if !(already_favorited?)
      flash[:notice] = "Cannot unfavorite"
    else
      @favorite.destroy
    end
    redirect_to cocktail_path(@cocktail)
  end

  private

  def already_favorited?
    Favorite.where(user_id: current_user.id, cocktail_id:
    params[:cocktail_id]).exists?
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_favorite
    @favorite = @cocktail.favorites.find(params[:id])
 end
end
