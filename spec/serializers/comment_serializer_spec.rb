require "rails_helper"

feature CommentSerializer do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }
  let(:comment) { create :comment, article: article }
  subject { described_class.new(comment, root: false).as_json }

  scenario "serializes correctly" do
    expect(subject[:id]).to eq comment.id
    expect(subject[:text]).to eq comment.text
  end
end
