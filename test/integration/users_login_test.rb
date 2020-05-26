require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:zerak)
    @topic = topics(:one)
    @post = @user.posts.build(content: "Lorem ipsum", topic_id: @topic.id,
                                       title: "Lorem ipsum")
  end

  test "login with invalid information" do
    get login_path
    # assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    # assert_template 'sessions/new'
    assert_not flash.empty?
    get login_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    #### need the rails-controller-testing gem to run the tests below
    # assert_template 'users/show'
    # assert_select "a[href=?]", login_path, count: 0
    # assert_select "a[href=?]", logout_path
    # assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    #### need the rails-controller-testing gem to run the tests below
    # assert_select "a[href=?]", login_path
    # assert_select "a[href=?]", logout_path,      count: 0
    # assert_select "a[href=?]", user_path(@user), count: 0
  end
end