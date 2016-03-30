require "rails_helper"

feature "Contact Email" do
  let(:contact_attributes) { attributes_for(:contact) }

  scenario "Visitor send contacts", js: true do
    visit new_contact_path
    fill_form(:contact, contact_attributes)
    click_on I18n.t "app.actions.send"

    expect(page).to have_content(I18n.t("app.home"))
    expect(page).to have_content(I18n.t("flash.contacts.create.notice", resource_name: "Contact"))
  end
end
