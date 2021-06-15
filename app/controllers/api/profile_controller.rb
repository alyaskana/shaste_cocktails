class Api::ProfileController < ApplicationController
  before_action :authenticate_user!

  def my_bar
    ingredients = current_user.ingredients
    render :my_bar, locals: {ingredients: ingredients}
  end
end
