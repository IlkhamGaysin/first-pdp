require "rails_helper"

feature "About" do
  background do
    visit root_path
  end

  scenario "Visitor can show about us page" do
    click_link I18n.t "app.about"
    expect(page).to have_content I18n.t "app.about"
  end
end
