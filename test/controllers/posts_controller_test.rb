require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:zerak)
    @topic = topics(:one)
    
    @post = @user.posts.build(content: "Lorem ipsum", topic_id: @topic.id,
                                       title: "Lorem ipsum")
  end

  test "should redirect new when not logged in" do
    get new_post_url
    assert_redirected_to login_url
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "Lorem ipsum", topic_id: @topic.id,
                                    title: "Lorem ipsum", user_id: @user.id} }
    end
    assert_redirected_to login_url
  end

  test "should show post" do
    @post = posts(:orange)
    get post_url(@post)
    assert_response :success
  end
end
