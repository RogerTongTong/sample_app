require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_empty flash
  end

  test "valid signup information" do
    get signup_path
    name     = "Example User"
    email    = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:                  name,
                                            email:                 email,
                                            password:              password,
                                            password_confirmaiton: password }
    end
    assert_template 'users/show'
    assert_not_empty flash
  end
end

