require 'spec_helper'

feature "Creating comments" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }
  let!(:ticket) { Factory(:ticket, :project => project, :user => user) }

  before do
    define_permission!(user, "view", project)
    sign_in_as!(user)

    visit "/"
    click_link project.name
  end

  scenario "Creating a comment" do
    message = "This is my comment!"
    click_link ticket.title
    fill_in "Text", :with => message
    click_button "Create Comment"

    page.should have_content "Comment has been created"

    within "#comments" do
      page.should have_content message
    end
  end

  scenario "Creating an invalid comment" do
    click_link ticket.title
    fill_in "Text", :with => ""
    click_button "Create Comment"

    page.should have_content "Comment was not created"
    page.should have_content "Text can't be blank"
  end
end