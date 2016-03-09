require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  
  test "get sign up form and create user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "john", email: "john@example.com", password: "password", admin: false}
    end
    assert_template 'users/show'
    assert_match 'john', response.body
  end
  
end