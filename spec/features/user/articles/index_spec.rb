require "rails_helper"

feature "See Articles" do
  include_context "current user signed in"
  let!(:another_user) { create :user }
  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article, user: another_user }
  let(:decorated_article) { article.decorate }

  background do
    visit articles_path
  end

  scenario "User can see create article list" do
    expect(page).to have_content I18n.t "app.actions.index"
    expect(page).to have_content I18n.t "app.actions.create"
  end

  scenario "User can see own articles" do
    expect(page).to have_content article.title
    expect(page).to have_content article.description
    expect(page).to have_content decorated_article.author
  end
  scenario "User can see which do not belong to him" do
    expect(page).to have_content another_article.title
    expect(page).to have_content another_article.description
  end
end
