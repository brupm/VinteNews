module IntegrationSpecHelper  
  def login_as(user, pass)
    visit login_path
    fill_in "Login", :with => user
    fill_in "Password", :with => pass
    
    click_button "Login"
  end

  def set_login_as(login, password)
    session = UserSession.create(:login => login, :password => password)
    @controller.stub!(:current_user_session).and_return(session)
    @controller.stub!(:current_user).and_return(session.record)
  end

  def logout
    visit logout_path
  end
  
  # def navigate_to(menu_item)
  #   within(:xpath, "//ul[@id='menu']") do
  #     click_link menu_item
  #   end
  # end
  # 
  # def navigate_to_user_box(menu_item)
  #   within(:xpath, "//p[@id='userbox']") do
  #     click_link menu_item
  #   end
  # end
end
