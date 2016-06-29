require "rails_helper"

feature "Update Article" do
  include_context "current user signed in"

  let!(:article_attributes) { attributes_for(:article) }
  let!(:article) { create :article, user: current_user }
  let!(:decorated_article) { article.decorate }

  background do
    visit edit_article_path(article)
  end

  scenario "User sees edit article form" do
    expect(page).to have_content "Edit Article"
  end

  scenario "Fill form and update" do
    fill_form(:user, article_attributes)
    click_on "Update"

    expect(page).to have_content "Article"
    expect(page).to have_content article_attributes[:title]
    expect(page).to have_content "Article was successfully updated."
  end
end
