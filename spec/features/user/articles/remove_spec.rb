require "rails_helper"

feature "Remove Own Article" do
  include_context "Full context data"
  let(:decorated_article) { article.decorate }

  background do
    login_as current_user
    visit articles_path
  end

  subject { page }

  context "remove action" do
    before do
      within "#article_#{article.id}" do
        click_link "Remove"
      end
    end

    context "doesn't see removed article" do
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

  context "see remove link" do
    let(:object) { article }
    let(:another_object) { another_article }
    let(:object_name) { article.model_name.singular }
    let(:checking_link) { "Remove" }

    it_behaves_like "permissions to links"
  end
end
