class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def new; end

  def create
    @user = login(params[:name], params[:password])
    if @user
      redirect_to new_user_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, danger: "ログアウトしました"
  end
end
