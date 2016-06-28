require "rails_helper"

feature "Edit Article" do
  include_context "current user signed in"

  let!(:article_attributes) { attributes_for(:article) }
  let!(:article) { create :article, user: current_user }
  let!(:decorated_article) { article.decorate }

  background do
    visit edit_article_path(article)
  end

  subject { page }

  context "edit form" do
    it { is_expected.to have_content "Edit Article" }
  end

  context "update action" do
    before do
      fill_form(:user, article_attributes)
      click_on "Update"
    end

    it { is_expected.to have_content "Article" }
    it { is_expected.to have_content article_attributes[:title] }
    it { is_expected.to have_content "Article was successfully updated." }
  end
end
