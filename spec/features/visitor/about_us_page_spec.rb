require "rails_helper"

feature "About" do
  background do
    visit root_path
  end

  scenario "Visitor can show about us page" do
    click_link "About Us"
    expect(page).to have_content "About Us"
  end
end
