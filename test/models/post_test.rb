require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:zerak)
    @topic = topics(:one)
    
    # This code is not idiomatically correct.
    @post = Post.new(content: "Lorem ipsum", user_id: @user.id,
                       topic_id: @topic.id, title: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test "title should not be too short" do
    @post.title = "a" * 4
    assert_not @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "topic id should be present" do
    @post.topic_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be at most 1000 characters" do
    @post.content = "a" * 1001
    assert_not @post.valid?
  end
end
