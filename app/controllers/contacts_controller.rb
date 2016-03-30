class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  expose(:contact) { Contact.new(contact_attributes) }

  def new
  end

  def create
    ContactMailerSender.call(contact_attributes) if contact.valid?
    respond_with contact, location: -> { root_path }
  end

  private

  def contact_attributes
    params.fetch(:contact, {}).permit(:email, :name, :message)
  end
end
