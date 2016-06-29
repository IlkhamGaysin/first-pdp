class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :email, :name, :message, presence: true
  validates :name, length: { in: 2..100 }
  validates :message, length: { in: 1..1000 }
  validates :email, format: Devise.email_regexp

  def attributes=(attributes)
    attributes.each do |key, value|
      public_send "#{key}=", value
    end
  end
end
