class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    # render :plain => user.inspect
    # return
    if user
      flash[:alert] = "ログインに成功しました"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "ログインに失敗しました"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    flash[:alert] = "ログアウトしました"
    redirect_to login_path
  end
end
