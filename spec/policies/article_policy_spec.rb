require "rails_helper"

describe ArticlePolicy do
  let!(:user) { create :user }
  let!(:article) { create :article, user: user }
  let!(:another_user) { create :user }

  context "for a antoher user" do
    subject { described_class.new(another_user, article) }

    it { is_expected.not_to permit_action(:manage) }
  end

  context "for a user" do
    subject { described_class.new(user, article) }

    it { is_expected.to permit_action(:manage) }
  end
end
