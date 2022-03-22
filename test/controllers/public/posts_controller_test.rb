require "test_helper"

class Public::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get public_posts_index_url
    assert_response :success
  end

  test "should get showedit" do
    get public_posts_showedit_url
    assert_response :success
  end
end
