require 'dotenv'
Dotenv.load
require "stripe"
Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
#connected_stripe_acct = "acct_1E7UXGA2NCw8FkEN"

=begin
acct = Stripe::Account.create({
  :country => "JP",
  :type => "standard",
})

charge = Stripe::Charge.create({
  :amount => 1000,
  :currency => "jpy",
  :source => "tok_visa",
  :transfer_data => {
    :destination => "acct_1E7EWSHdROvL6niF"
  }
})

charge = Stripe::Charge.create({
  :amount => 300,
  :currency => "jpy",
  :source => "tok_visa",
}, :stripe_account => connected_stripe_acct)
=end

# Direct Charge
charge = Stripe::Charge.create({
  :amount => 600,
  :currency => "jpy",
  :source => "tok_visa",
}, :stripe_account => "acct_1E7UXGA2NCw8FkEN" )