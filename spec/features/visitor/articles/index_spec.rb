require "rails_helper"

feature "Articles list" do
  include_context "Full context data"
  let(:decorated_article) { article.decorate }

  background do
    visit articles_path
  end

  scenario "Visitor doesn't see create link" do
    expect(page).not_to have_content "Create"
  end

  scenario "Visitor sees own article info" do
    expect(page).to have_content article.title
    expect(page).to have_content article.description
    expect(page).to have_content decorated_article.author
  end

  scenario "Visitor sees another article info" do
    expect(page).to have_content another_article.title
    expect(page).to have_content another_article.description
  end
end
