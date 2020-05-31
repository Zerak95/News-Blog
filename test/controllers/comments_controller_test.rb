require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:zerak)
    @post = posts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "Lorem ipsum",
                                     post_id: @post.id, user_id: @user.id} }
    end
    assert_redirected_to login_url
  end
end
