require "rails_helper"

feature CommentSerializer do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }
  let(:comment) { create :comment, article: article, user: current_user }
  subject { described_class.new(comment, root: false).as_json }

  before do
    allow_any_instance_of(described_class)
      .to receive(:own_object)
      .and_return(true)
  end

  scenario "serializes correctly" do
    expect(subject[:id]).to eq comment.id
    expect(subject[:text]).to eq comment.text
    expect(subject[:remove_url]).to include "/comments/#{comment.id}"
    expect(subject[:author]).to eq "created by #{current_user.full_name}"
  end
end
