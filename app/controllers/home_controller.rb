class HomeController < ApplicationController
  respond_to :json, :html

  def index
    respond_with(home_timeline)
  end

private
  def home_timeline
    twitter_client.home_timeline
  end

end

