shared_context "Full context data" do
  let!(:current_user) { create :user }
  let!(:another_user) { create :user }
  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article, user: another_user }
  let!(:comment) { create :comment, article: article, user: current_user }
  let!(:another_comment) { create :comment, article: article, user: another_user }
end
