require 'dotenv'
Dotenv.load
require "stripe"
Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
require "net/http"
require "uri"
require "json"

uri = URI.parse("https://connect.stripe.com/oauth/token")
request = Net::HTTP::Post.new(uri)
request.set_form_data(
  "client_secret" => "sk_test_o3aIltNXhkqjveSuhssYghdf",
  "code" => "ac_Eb5tdEafyqHtnsapcAbx4oLeBLgpTbDY",
  "grant_type" => "authorization_code",
)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

res = JSON.parse(response.body)

puts response.body
puts response.code.class
stripe_user_id = res["stripe_user_id"]
puts stripe_user_id

