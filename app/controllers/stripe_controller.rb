class StripeController < ApplicationController
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
