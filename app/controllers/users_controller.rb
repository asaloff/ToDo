class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by slug: params[:id]
    @tasks = @user.tasks.all.sort_by{|x| x.priority}
    require_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      flash['notice'] = "You are now registered"
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end