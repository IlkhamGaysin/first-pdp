require "rails_helper"

feature "User Article" do
  include_context "Full context data"
  let(:decorated_article) { article.decorate }

  background do
    visit article_path(article)
  end

  scenario "Visitor sees own article info" do
    expect(page).to have_content article.title
    expect(page).to have_content article.description
    expect(page).to have_content decorated_article.author
  end

  scenario "Visitor doesn't see another article info" do
    expect(page).not_to have_content another_article.title
    expect(page).not_to have_content another_article.description
  end
end
