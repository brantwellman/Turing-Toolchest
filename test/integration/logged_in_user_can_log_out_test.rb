require 'test_helper'

class LoggedInUserCanLogOutTest < ActionDispatch::IntegrationTest

  test "logged in user can log out" do
    user = User.create(username: "George", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Log-in"

    assert page.has_content?("Welcome back, George")

    click_link "Logout"

    refute page.has_content?("Welcome back, George")
  end
end
