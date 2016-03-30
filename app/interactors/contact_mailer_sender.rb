class ContactMailerSender
  include Interactor

  def call
    ContactMailer.notification(
      context.name,
      context.email,
      context.message
    ).deliver_later
  end
end
