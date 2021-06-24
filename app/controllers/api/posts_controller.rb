class Api::PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = current_user.posts.new(post_params)

    unless post.save
      return render json: { errors: post.errors, status: :unprocessable_entity }
    end

    render :create, locals: {post: post}
  end

  private 

  def post_params
    params.require(:post).permit(:content, :parent_id, :image, :cocktail_id)
  end
end

