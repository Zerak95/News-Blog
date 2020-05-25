require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "Topic should be valid" do
    @topic = Topic.new(name: "test topic")
    assert @topic.valid?
  end
end
