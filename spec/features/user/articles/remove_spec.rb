require "rails_helper"

feature "Remove Own Article" do
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
    it "exist by own article" do
      within "#article_#{article.id}" do
        is_expected.to have_content I18n.t "app.actions.remove"
      end
    end

    it "doesn't exist by another article" do
      within "#article_#{another_article.id}" do
        is_expected.not_to have_content I18n.t "app.actions.remove"
      end
    end
  end

  context "result after action" do
    before do
      within "#article_#{article.id}" do
        click_link "Remove"
      end
    end

    context "do not see removed article" do
      it { is_expected.not_to have_content article.title }
      it { is_expected.not_to have_content article.description }
    end

    context "see another article" do
      it { is_expected.to have_content another_article.title }
      it { is_expected.to have_content another_article.description }
    end

    context "see successfully message" do
      it { is_expected.to have_content "Article was successfully destroyed." }
    end
  end
end
