class StaticPagesController < ApplicationController

  def home
    if signed_in? 
      @user = current_user
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def rss_feed
    @user = current_user
    @rss_feed = current_user.feed
  end

end
