require "rails_helper"

describe ArticlePolicy do
  let!(:user) { create :user }
  let!(:object) { create :article, user: user }
  let!(:another_user) { create :user }

  it_behaves_like "article and comment policy"
end
