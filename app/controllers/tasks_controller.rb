class TasksController < ApplicationController
  before_action :set_task_user_id
  before_action :set_task_id, only: [:edit, :update, :show, :destroy]
  
  before_action :logged_in_user
  before_action :correct_task_user_id
  
  def index
    @tasks = @user_id.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @task = @user_id.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user_id
    else
      render :new
    end
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url @user_id, @task
    else
      render :edit
    end
  end
  
  def destroy
    if @task.destroy
      flash[:success] = "タスクを削除しました。"
      redirect_to user_tasks_url @user_id, @task
    end
  end
  
  private
  
    def task_params
      params.require(:task).permit(:taskname, :detailed)
    end
  
end
