require 'test_helper'

class PostMessagesTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
  end

  test "post a valid message" do
    log_in
    visit new_post_path
    assert_current_path new_post_path
    fill_in "Body", with: "This is a valid test message."
    click_on "Post message"
    assert_current_path root_path
  end

  test "post an invalid message" do
    log_in
    visit new_post_path
    assert_current_path new_post_path
    fill_in "Body", with: "T"
    click_on "Post message"
    assert_current_path posts_path
  end

  test "try to visit 'posts/new' without being logged in" do
    visit new_post_path
    assert_current_path login_path
  end

  private

    def log_in
      visit login_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "password"
      click_button "Log in"
    end
end
