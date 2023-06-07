require "test_helper"

class Pubilc::RecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pubilc_recipe_new_url
    assert_response :success
  end

  test "should get create" do
    get pubilc_recipe_create_url
    assert_response :success
  end
end
