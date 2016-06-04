require "rails_helper"

feature "User Article" do
  include_context "current user signed in"
  let!(:article) { create :article, user: current_user }
  let!(:another_user) { create :user }
  let!(:another_article) { create :article, user: another_user }
  let(:decorated_article) { article.decorate }

  background do
    visit article_path(article)
  end

  subject { page }

  context "info" do
    context "own" do
      it { is_expected.to have_content article.title }
      it { is_expected.to have_content article.description }
      it { is_expected.to have_content decorated_article.author }
    end

    context "another" do
      it { is_expected.not_to have_content another_article.title }
      it { is_expected.not_to have_content another_article.description }
    end
  end

  context "links" do
    it { is_expected.to have_content I18n.t "app.actions.edit" }
    it { is_expected.not_to have_content I18n.t "app.actions.show" }
  end
end
