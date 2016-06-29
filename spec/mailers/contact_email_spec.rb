require "rails_helper"

feature ApplicationMailer do
  let(:contact_attributes) { attributes_for(:contact) }
  let(:support_email) { ENV["MAILER_SENDER_ADDRESS"] }

  subject do
    described_class.contact_email(
      contact_attributes[:name],
      contact_attributes[:email],
      contact_attributes[:message]
    )
  end

  it { is_expected.to have_subject("An email to tech support") }
  it { is_expected.to deliver_to(support_email) }
  it { is_expected.to deliver_from(support_email) }

  it { is_expected.to have_body_text(contact_attributes[:email]) }
  it { is_expected.to have_body_text(contact_attributes[:name]) }
  it { is_expected.to have_body_text(contact_attributes[:message]) }
end
