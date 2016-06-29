require "rails_helper"

feature "Contact Email" do
  let(:contact_attributes) { attributes_for(:contact) }

  scenario "Visitor send contacts" do
    visit new_contact_path
    fill_form(:contact, contact_attributes)
    click_on "Send"

    expect(page).to have_content("Contact was successfully sent.")
  end
end
