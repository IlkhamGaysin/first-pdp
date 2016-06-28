require "rails_helper"

feature "Remove Comment" do
  include_context "Full context data"

  background do
    login_as current_user
    visit article_path(article)
  end

  scenario "User remove own comment" do
    within "#comment_#{comment.id}" do
      click_link "Remove"
    end

    expect(page).to have_content another_comment.text
    expect(page).not_to have_content comment.text
  end

  feature "Permissions of user to remove comment link" do
    let(:object) { comment }
    let(:another_object) { another_comment }
    let(:object_name) { comment.model_name.singular }
    let(:checking_link) { "Remove" }

    it_behaves_like "permissions to links"
  end
end
