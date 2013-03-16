require 'spec_helper'

feature "Viewing Tickets" do
  before do
    user = Factory(:confirmed_user)
    textmate_2 = Factory(:project, :name => "TextMate 2")
    ticket_1 = Factory(:ticket, :project => textmate_2, :title => "Make it shiny!",
      :description => "Gradients, starbursts, oh my!")
    ticket_1.update_attribute(:user, user)
    define_permission!(user, "view", textmate_2)

    sign_in_as!(user)
    visit "/"
  end

  scenario "Viewing tickets for a project" do
    click_link "TextMate 2"
    page.should have_content("Make it shiny!")
    page.should_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do
      page.should have_content("Make it shiny!")
    end
    page.should have_content("Gradients, starbursts, oh my!")
  end
end
