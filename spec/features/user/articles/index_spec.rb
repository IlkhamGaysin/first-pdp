require "rails_helper"

feature "Articles list" do
  include_context "current user signed in"
  let!(:another_user) { create :user }
  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article, user: another_user }
  let(:decorated_article) { article.decorate }

  background do
    visit articles_path
  end

  subject { page }

  context "links" do
    it { is_expected.to have_content I18n.t "app.articles.index" }
    it { is_expected.to have_content I18n.t "app.actions.create" }
  end

  context "own article" do
    it { is_expected.to have_content article.title }
    it { is_expected.to have_content article.description }
    it { is_expected.to have_content decorated_article.author }
  end

  context "another article" do
    it { is_expected.to have_content another_article.title }
    it { is_expected.to have_content another_article.description }
  end
end
