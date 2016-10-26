class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      p "session[:user_id]"
      p session[:user_id]
      log_in user
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      p "session[:user_id]"
      p session[:user_id]
      redirect_to user
    else
      p 3
      render 'new'
      flash.now[:danger]='Invalid email/password combination'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
