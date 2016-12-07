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
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      render 'new'
      flash.now[:danger]='Invalid email/password combination'
    end
      if (request.path_info == "/auth/twitter/callback")
        auth = request.env["omniauth.auth"]
        session[:oauth_token] = auth.credentials.token
        session[:oauth_token_secret] = auth.credentials.secret
        session[:username] = auth.extra.access_token.params[:screen_name]
        redirect_to "/tweet", :notice => "サインイン！"
      end
  end
  
  def destroy
    log_out if logged_in?
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    redirect_to root_url, :notice => "サインアウト！"
    if (request.path_info == "/signout_twitter")
      session[:username] = nil
    end
  end
  
end
