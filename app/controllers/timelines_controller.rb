class TimelinesController < ApplicationController
  respond_to :json

  def show
    timeline_type = params[:id]
    respond_with send("#{timeline_type}_timeline")
  end

private
  def home_timeline
    twitter_client.home_timeline
  end

  def user_timeline
    twitter_client.user_timeline
  end
end

