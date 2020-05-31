require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:zerak)
    @post = posts(:orange)
    
    @comment = @user.comments.build(content: "Lorem ipsum", post_id: @post.id,)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 1000 characters" do
    @comment.content = "a" * 501
    assert_not @comment.valid?
  end

  test "order should be most recent last" do
    assert_equal comments(:most_recent), Comment.last
  end
end
