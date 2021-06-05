class Api::IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.where("name LIKE ?", "%#{params[:search]}%")
    render :index, locals: {ingredients: ingredients}
  end
end

