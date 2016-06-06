shared_context "Full context with signed user" do
  let!(:current_user) { create :user }
  let!(:another_user) { create :user }
  let!(:article) { create :article, user: current_user }
  let!(:comment) { create :comment, article: article, user: current_user }
  let!(:another_comment) { create :comment, article: article, user: another_user }

  background do
    login_as current_user
  end
end
