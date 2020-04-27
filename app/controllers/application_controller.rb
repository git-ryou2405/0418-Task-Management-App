class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # ユーザーID取得
  def set_user
    @user = User.find(params[:id])
  end
  
  # タスク用ユーザーID取得
  def set_task_user_id
    @user_id = User.find(params[:user_id])
  end

  # タスクID取得
  def set_task_id
    @task = @user_id.tasks.find(params[:id])
  end
  
  # 現在ログイン済みのユーザーか判定
  def correct_user
    redirect_to(root_url) unless current_user == set_user
  end
  
  # 現在ログイン済みのユーザーか判定
  def correct_task_user_id
    redirect_to(root_url) unless current_user == set_task_user_id
  end
  
  # ログイン済みか確認
  def logged_in_user
    unless logged_in?
      flash[:success] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  # 現在ログイン済みのユーザーが管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin
  end
  
end
