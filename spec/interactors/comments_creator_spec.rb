require "rails_helper"

feature CommentsCreator do
  feature "#call" do
    include_context "current user signed in"
    let(:article) { create :article, user: current_user }

    let(:params) do
      {
        text: attributes_for(:comment)[:text],
        article_id: article.id
      }
    end

    subject(:context) { described_class.new(params) }

    scenario "Create comments for article" do
      expect { subject.call }.to change { article.comments.count }.by(1)
    end
  end
end
