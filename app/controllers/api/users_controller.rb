class Api::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def follow
    user = User.find_by(id: params[:id])
    unless user
      return render json: {error: "User with id=#{params[:id]} not found"}, status: 404
    end

    current_user.followings << user
    current_user.save!
    head :no_content
  end

  def unfollow
    user = User.find_by(id: params[:id])
    unless user
      return render json: {error: "User with id=#{params[:id]} not found"}, status: 404
    end

    current_user.followings.delete(user)
    current_user.save!
    head :no_content
  end

  def show
    user = User.find_by(login: params[:id])
    unless user
      return render json: {error: "User with id=#{params[:id]} not found"}, status: 404
    end
    render :show, locals: {user: user}
end

