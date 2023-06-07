require "test_helper"

class Pubilc::RecipeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pubilc_recipe_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get pubilc_recipe_comments_create_url
    assert_response :success
  end
end
