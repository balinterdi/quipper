class HomeController < ApplicationController
  def index
    if oauth_token
      @user_feed = home_timeline
    end
  end

private
  def home_timeline
    twitter_client.home_timeline
  end
end
