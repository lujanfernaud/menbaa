class PostsController < ApplicationController
  before_action :check_if_logged_in, except: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(user_id: @user.id, body: params[:post][:body].capitalize)

    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end

  private

    def check_if_logged_in
      return if logged_in?

      flash[:info] = "You need to be logged in to do that."
      redirect_to login_path
    end
end
