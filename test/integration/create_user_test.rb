require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  test "get sign up form and create user" do
    get user_path
    assert_template 'users/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect user_path, user: {username: "john", email: "john@example.com", password: "password", admin: true}
    end
    assert_template 'user/index'
    assert_match "john", response.body
  end
  
end