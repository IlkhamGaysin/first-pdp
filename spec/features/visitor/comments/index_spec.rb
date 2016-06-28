require "rails_helper"

feature "Comments" do
  include_context "Full context data"
  let(:decorated_comment) { comment.decorate }

  background do
    visit article_path(article)
  end

  scenario "Visitor sees own article" do
    expect(page).to have_content comment.text
    expect(page).to have_content decorated_comment.author
  end

  scenario "Visitor sees another article" do
    expect(page).to have_content another_comment.text
  end

  scenario "Visitor doesn't see 'Add' link" do
    expect(page).not_to have_content "Add"
  end
end
