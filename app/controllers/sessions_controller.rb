class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash["notice"] = "You've succesfully logged in."
      redirect_to user_path(user)
    else
      flash["error"] = "There was something wrong with your username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash["notice"] = "You've logged out succesfully."
    redirect_to login_path
  end
end