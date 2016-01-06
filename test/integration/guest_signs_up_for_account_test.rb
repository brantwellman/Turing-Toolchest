require 'test_helper'

class GuestSignsUpForAccountTest < ActionDispatch::IntegrationTest
  test "user is registered" do
    visit new_user_path
    fill_in "Username", with: "George"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create account"

    user = User.last

    assert_equal user_path(user), current_path
    assert page.has_content?("George")
    assert page.has_content?("Account created")
  end
end
