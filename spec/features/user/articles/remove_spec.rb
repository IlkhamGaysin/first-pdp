require "rails_helper"

feature "Remove Article" do
  include_context "Full context data"
  let(:decorated_article) { article.decorate }

  background do
    login_as current_user
    visit articles_path
  end

  feature "User remove own article" do
    before do
      within "#article_#{article.id}" do
        click_link "Remove"
      end
    end

    scenario "doesn't see removed article" do
      expect(page).not_to have_content article.title
      expect(page).not_to have_content article.description
    end

    scenario "redirected on articles page" do
      expect(current_url).to eql articles_url
    end

    scenario "sees successfully message" do
      expect(page).to have_content "Article was successfully destroyed."
    end
  end

  feature "Permissions of user to remove article links" do
    let(:object) { article }
    let(:another_object) { another_article }
    let(:object_name) { article.model_name.singular }
    let(:checking_link) { "Remove" }

    it_behaves_like "permissions to links"
  end
end
