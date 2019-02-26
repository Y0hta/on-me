class StripeController < ApplicationController
  require "net/http"
  require "uri"
  require "stripe"
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

  def disconnect
    @user = current_user

    if @user.stripe_id
      uri = URI.parse("https://connect.stripe.com/oauth/deauthorize")
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(Stripe.api_key, "")
      request.set_form_data(
        "client_id" => ENV["STRIPE_CONNECT_CLIENT_ID"],
        "stripe_user_id" => @user.stripe_id,
      )

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      if response.code == "200"
        @user.update!(stripe_id: nil)
        flash[:alert] = "Your account has been successfully disconnected"
      else
        @user.update!(stripe_id: nil)
        flash[:alert] = "Error"
      end
    end
    redirect_to edit_settings_path
  end

  def callback
    options = {
      site: "https://connect.stripe.com",
      authorize_url: "/oauth/authorize",
      token_url: "/oauth/token"
    }
    code = params[:code]
    @user = current_user
    client = OAuth2::Client.new(ENV["STRIPE_CONNECT_CLIENT_ID"],
                                ENV["STRIPE_SECRET_KEY"],
                                options)
    @resp = client.auth_code.get_token(code, :params => {:scope => "read_write"})
    @access_token = @resp.token
    @user.update!(stripe_id: @resp.params["stripe_user_id"]) if @resp
    flash[:notice] = "Your account has been successfully connected"
  end

  def payment_profile
    @account = Stripe::Account.retrieve("#{@user.stripe_id.to_s}") if @user.stripe_id.present?
    @balance = Stripe::Balance.retrieve() if @user.stripe_id.presetn?
  end
end
