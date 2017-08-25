module PostsHelper
  def author?(post)
    return false unless logged_in?

    current_user.id == post.user_id
  end
end
