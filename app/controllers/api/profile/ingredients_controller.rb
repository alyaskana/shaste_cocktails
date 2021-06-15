class Api::Profile::IngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
    ingredients = current_user.ingredients
    render :index, locals: {ingredients: ingredients}
  end

  def create
    ingredient = Ingredient.find_by(id: params[:id])

    unless ingredient
      return render json: {error: "Ingredient not found"}
    end

    current_user.ingredients = (current_user.ingredients + [ingredient]).uniq
    ingredients = current_user.ingredients
    render :index, locals: {ingredients: ingredients}
  end

  def destroy
    ingredient = Ingredient.find_by(id: params[:id])

    unless ingredient
      return render json: {error: "Ingredient not found"}
    end

    current_user.ingredients = (current_user.ingredients - [ingredient]).uniq
    ingredients = current_user.ingredients
    render :index, locals: {ingredients: ingredients}
  end
end
