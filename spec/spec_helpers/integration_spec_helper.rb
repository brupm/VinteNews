module IntegrationSpecHelper
  def login_as(user, pass)
    visit logout_path
    visit login_path
    fill_in "Login", :with => user
    fill_in "Password", :with => pass

    click_button "Login"
  end

  def logout
    visit logout_path
  end
end
