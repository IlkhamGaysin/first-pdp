require "rails_helper"

feature "Edit Article" do
  include_context "current user signed in"
  let(:article_attributes) { attributes_for(:article) }
  let(:article) { create :article, user: current_user }
  let(:decorated_article) { article.decorate }

  background do
    visit edit_article_path(article)
  end

  scenario "User can see create article form" do
    expect(page).to have_content I18n.t "app.articles.edit_title"
  end

  scenario "User can update article" do
    fill_form(:user, article_attributes)
    click_on I18n.t "app.actions.update"

    expect(page).to have_content I18n.t "app.articles.show"
    expect(page).to have_content article_attributes[:title]
    expect(page).to have_content "Article was successfully updated."
  end
end
