require 'spec_helper'

describe "Post" do

  it "should redirect to login page on new and create actions" do
    visit(new_post_path)
    page.should have_css(".notice")
    page.should have_content("You must be logged in to access this page")
  end

  describe "Logged in actions" do

    before(:each) do
      login_as("davis", "davis")
      visit(new_post_path)
    end
    it "should create an url post" do
      fill_in("Title", :with => "Testing an url post")
      fill_in("Url", :with => "http://blog.bopia.com/post/123")
      click_button("Submit")
    end

    it "should create a text post" do
      fill_in("Title", :with => "Testing a post")
      fill_in("Body", :with => "Lorem ipsum sum bleh bloh bli.")
      click_button("Submit")
    end

  end

end
