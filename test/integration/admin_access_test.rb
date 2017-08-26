require 'test_helper'

class AdminAccessTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @user  = users(:hiro)
  end

  test "admin can access admin dashboard" do
    log_in_as(@admin)
    visit admin_root_path
    assert_current_path admin_root_path
  end

  test "normal user cannot access admin dashboard" do
    log_in_as(@user)
    visit admin_root_path
    assert_current_path root_path
  end

  test "not logged in user cannot access admin dashboard" do
    visit admin_root_path
    assert_current_path login_path
  end

  private

    def log_in_as(user)
      visit login_path
      fill_in "Email",                 with: user.email
      fill_in "Password",              with: "password"
      click_on "Log in"
      assert_current_path root_path
    end
end
