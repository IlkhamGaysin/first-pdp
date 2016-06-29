class User < ActiveRecord::Base
  attachment :avatar

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments
  validates :full_name, presence: true
end
