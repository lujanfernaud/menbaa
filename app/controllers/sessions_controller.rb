class SessionsController < ApplicationController
  def new
    return unless logged_in?

    flash[:info] = "You are already logged in as #{current_user.name}."
    redirect_to root_url
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      remember_me? ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
