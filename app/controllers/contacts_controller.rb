class ContactsController < ApplicationController
  expose(:contact, attributes: :contact_attributes)

  def new
  end

  def create
    SendContact.call(contact_attributes) if contact.valid?
    respond_with contact, location: root_path
  end

  private

  def contact_attributes
    params.fetch(:contact, {}).permit(:email, :name, :message)
  end
end
