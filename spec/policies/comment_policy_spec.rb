describe CommentPolicy do
  let!(:user) { create :user }
  let!(:article) { create :article, user: user }
  let!(:object) { create :comment, user: user, article: article }
  let!(:another_user) { create :user }

  it_behaves_like "article and comment policy"
end
