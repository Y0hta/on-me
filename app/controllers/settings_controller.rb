class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @oauth_link = ENV["STRIPE_OAUTH_LINK"]
    if params[:code] 
      authorization_code = params[:code]
    end


  end

  def update
  end
end
