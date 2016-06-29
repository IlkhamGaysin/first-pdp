require "rails_helper"

feature "Upload Avatar" do
  include_context "current user signed in"
  include_context "upload avatar"

  scenario "User uploads avatar" do
    upload_avatar
    visit_profile_settings

    expect(page).to have_css("img[alt='Avatar']")
  end
end
