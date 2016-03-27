require "rails_helper"

feature "Home" do
  background do
    visit root_path
  end

  scenario "Visitor can show home page" do
    expect(page).to have_content I18n.t "app.home"
  end
end
