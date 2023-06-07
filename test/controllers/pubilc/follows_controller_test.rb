require "test_helper"

class Pubilc::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pubilc_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get pubilc_follows_destroy_url
    assert_response :success
  end

  test "should get followings" do
    get pubilc_follows_followings_url
    assert_response :success
  end

  test "should get followers" do
    get pubilc_follows_followers_url
    assert_response :success
  end
end
