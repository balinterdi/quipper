class TimelinesController < ApplicationController
  respond_to :json

  def show
    respond_with user_timeline(params[:id])
  end

private
  def user_timeline(screen_name)
    twitter_client.user_timeline(screen_name)
  end
end

