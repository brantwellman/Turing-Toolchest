require 'test_helper'

class LoggedInUserSeesOnlyHisOwnToolsTest < ActionDispatch::IntegrationTest
  test "logged in user sees only his own tools" do
    user = User.create(username: "George", password: "password")
    tool1 = Tool.create(name: "Tool1", use: "Use1")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Log-in"

    click_on "Create a new tool"
    fill_in "Name", with: "Tool2"
    fill_in "Use", with: "Use2"
    click_on "Submit that stupid tool"
# save_and_open_page
    assert_equal user_tools_path, current_path
    assert page.has_content?("Tool2")
    refute page.has_content?("Tool1")
  end
end
