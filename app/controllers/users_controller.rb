class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "You are now logged in."
      redirect_to root_path
    else
      render "users/new"
    end
  end

  def edit
  end

  private

    def user_params
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation,
                :humanizer_answer, :humanizer_question_id, :bypass_humanizer)
    end
end
