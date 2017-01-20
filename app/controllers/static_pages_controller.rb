class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  else
    @feed_item = Micropost.all.sample(6)
    @feed_item = Micropost.order("RANDOM()").first(6)
  end
end

  def help
  end

  def about
  end

  def contact
  end

  def new
  end
end
