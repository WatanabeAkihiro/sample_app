class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    require 'twitter'
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted!"
    redirect_to request.referrer || root_url
  end
  
   helper_method :timeline
 
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
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
