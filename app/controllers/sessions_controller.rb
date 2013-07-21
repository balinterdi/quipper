class SessionsController < ApplicationController
  def create
    update_user
    redirect_to root_path
  end

private
  def update_user
    user = User.first(conditions: { nickname: auth_hash.info.nickname })
    unless user
      user = User.new
    end
    user.update_attributes(user_attributes)
  end

  def user_attributes
    info = auth_hash.info
    creds = auth_hash.credentials
    {
      oauth_token: creds.token,
      oauth_token_secret: creds.secret,
      nickname: info.nickname,
      name: info.name,
      avatar_url: info.image,
      location: info.location,
      website: info.urls.Website,
      description: info.description
    }
  end

  def auth_hash
    request.env['omniauth.auth']
  end


end
