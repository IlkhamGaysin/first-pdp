require "rails_helper"

feature ContactMailer do
  let(:contact_attributes) { attributes_for(:contact) }
  let(:support_email) { ENV["MAILER_SENDER_ADDRESS"] }

  subject do
    described_class.notification(
      contact_attributes[:name],
      contact_attributes[:email],
      contact_attributes[:message]
    )
  end

  it { is_expected.to have_subject(I18n.t("app.mailers.contact.subject")) }
  it { is_expected.to deliver_to(support_email) }
  it { is_expected.to deliver_from(support_email) }

  it { is_expected.to have_body_text(contact_attributes[:email]) }
  it { is_expected.to have_body_text(contact_attributes[:name]) }
  it { is_expected.to have_body_text(contact_attributes[:message]) }
end
