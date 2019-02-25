require 'test_helper'

class StripeControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get stripe_callback_url
    assert_response :success
  end

  test "should get payment_profile" do
    get stripe_payment_profile_url
    assert_response :success
  end

end
