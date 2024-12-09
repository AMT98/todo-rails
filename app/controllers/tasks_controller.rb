class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:show, :edit, :update, :destory]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_prams)
      redirect_to tasks_path, notice: "Task updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destory
    @task.destory
    redirect_to tasks_path, notice: "Task deleted successfully!"
  end

  private
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "You must be logged in to access this page."
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
