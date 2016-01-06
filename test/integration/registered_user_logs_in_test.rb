require 'test_helper'

class RegisteredUserLogsInTest < ActionDispatch::IntegrationTest
  test "existing user can log in" do
    user = User.create(username: "George", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Log-in"

    assert_equal user_path(user), current_path
    assert page.has_content?("Welcome back, George")
  end
end
