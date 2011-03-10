module IntegrationSpecHelper
  def login_as(user, pass)
    visit logout_path
    visit login_path
    fill_in "user_session_login", :with => user
    fill_in "user_session_password", :with => pass

    click_button "Login"
  end

  def logout
    visit logout_path
  end
end
