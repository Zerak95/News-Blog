require 'test_helper'

class TopicTest < ActiveSupport::TestCase

  def setup
    @topic = Topic.new(name: "test topic")
  end

  test "Topic should be valid" do
    assert @topic.valid?
  end

  test "name should be present" do
    @topic.name = "     "
    assert_not @topic.valid?
  end

  test "name should be unique" do
    @topic.save
    @topic2 = Topic.new(name: "test topic")
    assert_not @topic2.valid?
  end

  test "name should not be too long" do
    @topic.name = "a" * 26
    assert_not @topic.valid?
  end

  test "view_count should start at 0" do
    assert @topic.view_count == 0
  end
end
