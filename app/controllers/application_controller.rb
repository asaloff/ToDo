class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :generate_title

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def access_denied
    flash["error"] = 'You do not have permissions to do that'
    redirect_to login_path
  end

  def require_user
    if !logged_in? || (logged_in? && current_user != @user)
      access_denied
    end
  end

  def generate_title
    body = params[:task]['body']
    if body.strip.include? " "
      @task.title = body[/^(\w+).(\w+)/]
    else
      @task.title = body
    end
  end
end
