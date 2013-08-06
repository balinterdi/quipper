class UsersController < ApplicationController
  respond_to :json

  def show
    respond_with twitter_client.user
  end
end

