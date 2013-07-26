class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :oauth_token

  before_filter :authenticate_with_twitter

private

  def authenticate_with_twitter
    unless oauth_token
      redirect_to root_path
    end
  end

  def twitter_client
    Twitter::Client.new(
      oauth_token: current_user.oauth_token,
      oauth_token_secret: current_user.oauth_token_secret
    )
  end

  def current_user
    if session[:current_user_id]
      User.find(session[:current_user_id])
    end
  end

  def oauth_token
    current_user.try(:oauth_token)
  end

end
