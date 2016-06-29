shared_examples "article and comment policy" do
  context "for a antoher user" do
    subject { described_class.new(another_user, object) }

    it { is_expected.not_to permit_action(:manage) }
  end

  context "for a user" do
    subject { described_class.new(user, object) }

    it { is_expected.to permit_action(:manage) }
  end
end
