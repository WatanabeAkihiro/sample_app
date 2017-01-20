class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "アカウントが有効化されておりません。"
        message += "メールを確認し、有効化を完了してください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      render 'new'
      flash.now[:danger]='無効なメールアドレス/パスワードです'
    end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
