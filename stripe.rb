require 'dotenv'
Dotenv.load
require "stripe"
Stripe.api_key = ENV["STRIPE_TEST_SECRET_KEY"]

acct = Stripe::Account.create({
  :country => "JP",
  :type => "standard",
})

=begin
charge = Stripe::Charge.create({
  :amount => 1000,
  :currency => "jpy",
  :source => "tok_visa",
  :transfer_data => {
    :destination => "acct_1E7EWSHdROvL6niF"
  }
})
=end
