require "rails_helper"

feature SendContact do
  feature "#call" do
    let(:contact_attributes) { attributes_for(:contact) }

    let(:params) do
      {
        name: contact_attributes[:name],
        email: contact_attributes[:email],
        message: contact_attributes[:message]
      }
    end

    subject(:context) { described_class.call(params) }

    scenario "Mailers count" do
      expect { context }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
