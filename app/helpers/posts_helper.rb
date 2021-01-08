module PostsHelper
  def post_cocktails(post)
    post.cocktails.pluck(:title).join(', ')
  end
end
