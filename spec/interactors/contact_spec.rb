require "rails_helper"

feature Contact do
  feature "#call" do
    let(:contact_attributes) { attributes_for(:contact) }

    let(:params) do
      {
        name: contact_attributes[:name],
        email: contact_attributes[:email],
        message: contact_attributes[:message]
      }
    end

    subject(:context) { described_class.new(params).valid? }

    scenario "Create comments for article" do
      expect(subject).to be_truthy
    end
  end
end
