require "rails_helper"

feature "Remove Avatar", js: true do
  include_context "current user signed in"
  include_context "upload avatar"

  background do
    upload_avatar
    visit_profile_settings
  end

  scenario "User uploads avatar" do
    click_on "Remove avatar"
    click_on "Update"

    visit_profile_settings

    expect(page).to have_css("img[alt='Defaultavatar']")
  end
end
