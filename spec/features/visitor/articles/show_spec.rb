require "rails_helper"

feature "User Article" do
  include_context "Full context data"
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
end
