require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"
  let(:article_attributes) { attributes_for(:article) }

  background do
    visit new_article_path
  end

  scenario "User can see create article form" do
    expect(page).to have_content "New Article"
  end

  scenario "User can create article" do
    fill_form(:user, article_attributes)
    click_on I18n.t "app.actions.create"

    expect(page).to have_content I18n.t "app.actions.index"
    expect(page).to have_content article_attributes[:title]
    expect(page).to have_content "Article was successfully created."
  end
end
