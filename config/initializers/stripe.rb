Rail.configuration.stripe = {
  :stripe_publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :secret_key => ENV['STRIPE_TEST_SECRET_KEY']
  :client_id => ENV['STRIPE_TEST_CONNECT_CLIENT_ID']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
