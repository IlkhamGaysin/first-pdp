class SendContact
  include Interactor

  def call
    ApplicationMailer.contact_email(
      context.name,
      context.email,
      context.message
    ).deliver_now
  end
end
