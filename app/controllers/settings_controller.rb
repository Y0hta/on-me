class SettingsController < ApplicationController
  def edit
    @oauth_link = ENV["STRIPE_OAUTH_LINK"]
  end

  def update
  end
end
