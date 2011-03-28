require 'spec_helper'

describe "Post" do
  fixtures :users

  it "should redirect to login page on new and create actions" do
    visit(new_post_path)
    page.should have_css(".notice")
    page.should have_content("Login")
  end

  describe "Logged in actions" do

    before(:each) do
      login_as("daviscabral", "daviscabral")
      visit(new_post_path)
    end

    it "should create an url post" do
      fill_in("post_title", :with => "Testing an url post")
      fill_in("post_url", :with => "http://blog.bopia.com/post/123")
      click_button("post_submit")
    end

    it "should create a text post" do
      fill_in("post_title", :with => "Testing a post")
      fill_in("post_body", :with => "Lorem ipsum sum bleh bloh bli.")
      click_button("post_submit")
    end

  end

end
