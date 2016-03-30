class ContactMailer < ApplicationMailer
  def notification(name, sender_email, message)
    @name = name
    @sender_email = sender_email
    @message = message

    mail to: ENV["MAILER_SENDER_ADDRESS"], subject: I18n.t("app.mailers.contact.subject")
  end
end
