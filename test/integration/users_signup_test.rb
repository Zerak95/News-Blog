require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # cant use the below test without the rails-controller-testing gem
    # assert_template 'users/new' 
    # assert_select 'div#<CSS id for error explanation>'
    # assert_select 'div.<CSS class for field with error>'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         phone_number: "1234567890",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert is_logged_in?
  end
end