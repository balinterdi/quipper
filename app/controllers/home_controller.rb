class HomeController < ApplicationController
  skip_before_filter :authenticate_with_twitter

  def index
    if current_user
      redirect_to timeline_path(id: current_user.nickname, format: :json)
    end
  end
end

