require "rails_helper"

feature "Articles list" do
  include_context "Full context data"
  let(:decorated_article) { article.decorate }

  background do
    visit articles_path
  end

  subject { page }

  context "link" do
    it { is_expected.not_to have_content "Create" }
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
