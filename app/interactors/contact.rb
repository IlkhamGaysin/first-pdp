class Contact
  include ActiveModel::Model

  attr_reader :name, :email, :message

  validates :email, presence: true

  validates :name, presence: true, length: { in: 2..100 }

  validates :message, presence: true, length: { in: 1..1000 }

  def initialize(contact_params)
    contact_params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
