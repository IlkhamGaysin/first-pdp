require "rails_helper"

feature "Remove Comment" do
  include_context "Full context with signed user"

  background do
    visit article_path(article)
  end

  subject { page }

  scenario "action", js: true do
    within "#comment_#{comment.id}" do
      click_on I18n.t "app.actions.remove"
    end
    wait_for_ajax
    is_expected.to have_content another_comment.text
    is_expected.not_to have_content comment.text
  end

  scenario "see remove link" do
    within "#comment_#{comment.id}" do
      is_expected.to have_content I18n.t("app.actions.remove")
    end
  end

  scenario "doesn't see remove link" do
    within "#comment_#{another_comment.id}" do
      is_expected.not_to have_content I18n.t("app.actions.remove")
    end
  end
end
