require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"
  let!(:article_attributes) { attributes_for(:article) }

  background do
    visit new_article_path
  end

  subject { page }

  context "new form" do
    it { is_expected.to have_content I18n.t "app.articles.new_title" }
  end

  context "create action" do
    before do
      fill_form(:user, article_attributes)
      click_on I18n.t "app.actions.create"
    end

    it { is_expected.to have_content I18n.t "app.articles.index" }
    it { is_expected.to have_content article_attributes[:title] }
    it { is_expected.to have_content "Article was successfully created." }
  end
end
