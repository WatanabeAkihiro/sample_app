 require 'twitter'

class TweetController < ApplicationController

  helper_method :timeline



def create
  if (request.path_info == "/auth/twitter/callback")
    auth = request.env["omniauth.auth"]
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    session[:username] = auth.extra.access_token.params[:screen_name]
    redirect_to "/tweet", :notice => "サインイン！"
  end
end

def destroy
  session[:oauth_token] = nil
  session[:oauth_token_secret] = nil
  redirect_to root_url, :notice => "サインアウト！"
  if (request.path_info == "/signout_twitter")
    session[:username] = nil
  end
end

  ## twitter apiを叩いてタイムラインを表示する ##
  def timeline
    ## 何でこれ書いてるんだろう...多分無くても動く気はします ##
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end

    client.home_timeline(:count => 200).each do |tweet|
      ## 作りかけで恐縮ですが...二重配列にRT数などの要素を格納する予定です ##
      @array = Array.new
      @total_array = Array.new
      text = tweet.full_text
      fav = tweet.favorite_count
      rt = tweet.retweet_count
      @weight = fav + rt * 1.5
      @array = [text, fav, rt, @weight]
      p @array
    end
  end
end
