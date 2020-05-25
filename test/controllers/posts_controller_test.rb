require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # @user = users(:zerak)
    # @topic = topics(:one)
    
    # @post = post(:orange)
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end
end
