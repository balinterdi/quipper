class HomeController < ApplicationController
  def index
    @user_feed = Twitter.user_timeline(current_user.nickname)
  end

private
  def user_feed
    Twitter.user_timeline(current_user.nickname)
  end
end
