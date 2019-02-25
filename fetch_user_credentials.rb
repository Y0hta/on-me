require 'dotenv'
Dotenv.load
require "stripe"
Stripe.api_key = ENV["STRIPE_TEST_SECRET_KEY"]
connected_stripe_acct = "ac_EalW470SMDMmObThIw5WpCr4tZXp82jj"

