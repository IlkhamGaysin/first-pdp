class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILER_SENDER_ADDRESS"]

  def contact_email(name, sender_email, message)
    @name = name
    @sender_email = sender_email
    @message = message

    mail to: ENV["MAILER_SENDER_ADDRESS"], subject: "An email to tech support"
  end
end
