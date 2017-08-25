require 'test_helper'

class DeleteMessagesTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
  end

  test "user can delete a message" do
    visit root_path
    log_in
    click_on "Delete", match: :first
    assert page.has_css? "div.alert"
    assert page.has_content? "deleted"
  end

  private

    def log_in
      visit login_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "password"
      click_button "Log in"
      assert_current_path root_path
    end
end
