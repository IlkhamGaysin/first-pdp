require "rails_helper"

feature "Article comments" do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }
  let(:comment_attributes) { attributes_for(:comment) }

  background do
    visit article_path(article)
  end

  scenario "leave comment", js: true do
    fill_in "comment_text", with: comment_attributes[:text]
    click_on "Add"
    wait_for_ajax

    within ".comments-list" do
      expect(page).to have_content comment_attributes[:text]
    end
  end
end
