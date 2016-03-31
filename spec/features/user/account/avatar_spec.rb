require "rails_helper"

feature "User Avatar" do
  let(:current_user) { create :user, :with_avatar }

  background do
    login_as current_user
    visit edit_user_registration_path(current_user)
  end

  scenario "User see your avatar" do
    expect(page).to have_selector "img.user-avatar"
  end
end
