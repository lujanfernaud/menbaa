require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup" do
    visit signup_path
    fill_in "Name",                  with: "John"
    fill_in "Email",                 with: "john@testuser.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    assert_current_path root_path
    assert page.has_content?("Log out")
    assert page.has_content?("logged in")
  end

  test "invalid name" do
    visit signup_path
    fill_in "Name",                  with: "J"
    fill_in "Email",                 with: "john@testuser.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_signup_with_invalid_data
  end

  test "invalid email" do
    visit signup_path
    fill_in "Name",                  with: "John"
    fill_in "Email",                 with: "@testuser.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_signup_with_invalid_data
  end

  test "empty password" do
    visit signup_path
    fill_in "Name",                  with: "John"
    fill_in "Email",                 with: "john@testuser.com"
    fill_in "Password",              with: ""
    fill_in "Password confirmation", with: ""
    click_signup_with_invalid_data
  end

  private

    def click_signup_with_invalid_data
      click_button "Sign up"
      assert_current_path signup_path
      assert page.has_css?("div#error_explanation")
    end
end
