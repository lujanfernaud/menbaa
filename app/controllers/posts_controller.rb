class PostsController < ApplicationController
  before_action :check_if_logged_in, except: :index
  before_action :check_if_author,    only:   :destroy

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(user_id: @user.id, body: post_body)

    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end

  def destroy
    post    = Post.find_by(id: params[:id])
    post_id = post.id
    post.delete

    flash[:info] = "Message ##{post_id} deleted."
    redirect_to root_path
  end

  private

    def check_if_logged_in
      return if logged_in?

      flash[:info] = "You need to be logged in to do that."
      redirect_to login_path
    end

    def check_if_author
      return false unless current_user.id == params[:user_id]
    end

    def post_body
      body = params[:post][:body].to_s
      body.first.upcase + body[1..-1].to_s
    end
end
