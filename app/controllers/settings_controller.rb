class SettingsController < ApplicationController
  before_action :authenticate_user!

  require "stripe"
  require "net/http"
  require "uri"
  require "json"
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

  def edit
    @user = current_user
    @oauth_link = ENV["STRIPE_OAUTH_LINK"]

    if params[:code] && @user.stripe_id==nil
      # Callback
      authorization_code = params[:code]

      # Fetch the user's credentials from Stripe
      uri = URI.parse("https://connect.stripe.com/oauth/token")
      request = Net::HTTP::Post.new(uri)
      request.set_form_data(
        "client_secret" => Stripe.api_key,
        "code" => authorization_code,
        "grant_type" => "authorization_code",
      )

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      if response.code == "200"
        res = JSON.parse(response.body)
        @user.update!(stripe_id: res["stripe_user_id"]) if res
      else
        flash[:alert] = "Bad request."
      end
    end
    @acct = Stripe::Account.retrieve(@user.stripe_id) if @user.stripe_id
  end

  def update
  end
end
