class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
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

  def edit
  end

  def update
    if @user.update(user_params)
      flash['notice'] = "You've updated your information"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find_by slug: params[:id]
  end
end