require "rails_helper"

feature "Comments" do
  include_context "Full context with signed user"
  let(:decorated_comment) { comment.decorate }

  background do
    visit article_path(article)
  end

  subject { page }

  context "info" do
    context "own" do
      it { is_expected.to have_content comment.text }
      it { is_expected.to have_content decorated_comment.author }
    end

    context "another" do
      it { is_expected.to have_content another_comment.text }
    end
  end

  context "links" do
    it { is_expected.to have_content I18n.t("app.comments.add_comment") }
  end
end
