require "rails_helper"

feature "Remove Comment" do
  include_context "Full context data"

  background do
    login_as current_user
    visit article_path(article)
  end

  subject { page }

  scenario "action" do
    within "#comment_#{comment.id}" do
      click_link "Remove"
    end

    is_expected.to have_content another_comment.text
    is_expected.not_to have_content comment.text
  end

  context "see remove link" do
    let(:object) { comment }
    let(:another_object) { another_comment }
    let(:object_name) { comment.model_name.singular }
    let(:checking_link) { "Remove" }

    it_behaves_like "permissions to links"
  end
end
