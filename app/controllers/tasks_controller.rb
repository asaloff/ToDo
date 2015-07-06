class TasksController < ApplicationController
  before_action :find_user
  before_action :require_user
  before_action :find_task, only: [:edit, :update, :destroy]


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.creator = current_user
    generate_title

    if @task.save
      flash["notice"] = "You're task was added successfully"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash["notice"] = "You're task has been updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { @task.destroy }
    end
  end

  private

  def task_params
    params.require(:task).permit(:body, :priority, :title)
  end

  def find_user
    @user = User.find_by slug: params[:user_id]
  end

  def find_task
    @task = Task.find_by slug: params[:id]
  end
end