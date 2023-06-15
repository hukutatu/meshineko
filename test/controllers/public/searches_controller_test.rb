require "test_helper"

class Public::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get searche" do
    get public_searches_searche_url
    assert_response :success
  end
end
