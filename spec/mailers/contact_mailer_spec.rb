require "rails_helper"

feature ContactMailer do
  let(:contact_attributes) { attributes_for(:contact) }
  let(:support_email) { ENV["MAILER_SENDER_ADDRESS"] }
  let(:subject) { I18n.t("app.mailers.contact.subject") }

  feature "#notification" do
    let(:mail) { sent_notify }

    scenario "renders the headers" do
      expect(mail.subject).to eq(subject)
      expect(mail.to).to eq([support_email])
      expect(mail.from).to eq([support_email])
    end

    scenario "renders the body" do
      expect(mail.html_part.decoded).to match(contact_attributes[:email])
      expect(mail.html_part.decoded).to match(contact_attributes[:name])
      expect(mail.html_part.decoded).to match(contact_attributes[:message])
    end
  end

  private

  def sent_notify
    described_class.notification(
      contact_attributes[:name],
      contact_attributes[:email],
      contact_attributes[:message]
    )
  end
end
