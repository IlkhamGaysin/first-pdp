shared_context "upload avatar" do
  let(:file) { File.open(Rails.root.join("spec/fixtures/images/test_image.jpg")) }

  def visit_profile_settings
    visit edit_user_registration_path(current_user)
  end

  def upload_avatar
    visit_profile_settings
    fill_form(:user, avatar: file)
    click_on "Update"
  end

  background do
    stub_request(:any, /amazonaws.com/)
  end
end
