require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
  end

  test "valid user login" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log in"
    assert_current_path root_path
  end

  test "invalid user login" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "pssswwrd"
    click_button "Log in"
    assert_current_path login_path
  end
end
