class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def follow
    user = User.find_by(id: params[:id])
    unless user
      return render json: {error: "User with id=#{params[:id]} not found"}
    end

    current_user.followings << user
    current_user.save!
    head :no_content
  end

  def unfollow
    user = User.find_by(id: params[:id])
    unless user
      return render json: {error: "User with id=#{params[:id]} not found"}
    end

    current_user.followings.delete(user)
    current_user.save!
    head :no_content
  end
end

