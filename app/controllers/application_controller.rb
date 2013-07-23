class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private
  def current_user
    if session[:current_user_id]
      User.find(session[:current_user_id])
    end
  end

  def oauth_token
    current_user.try(:oauth_token)
  end

  def oauth_token_secret
    current_user.try(:oauth_token_secret)
  end
end
