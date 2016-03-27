require "rails_helper"

feature "User Article" do
  include_context "current user signed in"
  let(:article) { create :article, user: current_user }
  let(:decorated_article) { article.decorate }

  background do
    visit articles_path(article)
  end

  scenario "User can see own article" do
    expect(page).to have_content article.title
    expect(page).to have_content article.description
    expect(page).to have_content decorated_article.author
    expect(page).to have_content I18n.t "app.actions.edit"
  end
end
