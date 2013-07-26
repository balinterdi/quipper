class TimelinesController < ApplicationController
  respond_to :json

  def show
    respond_with home_timeline
  end

private
  def home_timeline
    twitter_client.home_timeline
  end
end

