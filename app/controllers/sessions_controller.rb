class SessionsController < ApplicationController
  def create
    puts "Auth hash"
    p auth_hash
    redirect_to root_path
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end
